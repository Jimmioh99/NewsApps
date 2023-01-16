//
//  NewsSourcesViewController.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import UIKit

protocol NewsSourcesViewControllerDelegate: UIViewController {
    func successGetNewsSources(data: [NewsSourcesMediaModel])
    func failureGetNewsSources(error: Error)
}


final class NewsSourcesViewController: UIViewController {
    private let presenter: NewsSourcesPresenterDelegate
    private lazy var root: NewsSourcesView = NewsSourcesView()
    
    private var dataArr: [NewsSourcesMediaModel] = []
    
    private var categoryArr: [CategoryType] = CategoryType.allCases
    private var categoryIndex: Int = 0
    
    init(presenter: NewsSourcesPresenterDelegate) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setDelegate()
        
        getNewsSources()
        
    }
    
    func setDelegate() {
        root.categoryCollection.delegate = self
        root.categoryCollection.dataSource = self
        
        root.newsTable.delegate = self
        root.newsTable.dataSource = self
    }
    
    func getNewsSources() {
        presenter.getNewsSources(category: categoryArr[categoryIndex])
    }
    
    func reloadTable(data: [NewsSourcesMediaModel], isReload: Bool = true) {
        self.dataArr = data
        
        DispatchQueue.main.async {
            self.root.newsTable.reloadData()
        }
    }
}

extension NewsSourcesViewController: NewsSourcesViewControllerDelegate {
    func successGetNewsSources(data: [NewsSourcesMediaModel]) {
        reloadTable(data: data)
    }
    
    func failureGetNewsSources(error: Error) {
        // Should handler if got Error
        print(error)
    }
    
    
}

extension NewsSourcesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionCell.self), for: indexPath) as! CategoryCollectionCell
        cell.setupCell(data: categoryArr[indexPath.row], isSelected: indexPath.row == categoryIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = categoryArr[indexPath.row].rawValue
        let itemSize = item.size(
            withAttributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
            ]
        )
        return CGSize(width: itemSize.width + 20, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoryIndex = indexPath.row
        root.categoryCollection.reloadData()
        getNewsSources()
    }
}

extension NewsSourcesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsSourcesTableCell.self), for: indexPath) as! NewsSourcesTableCell
        cell.setupCell(model: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sourcesName = dataArr[indexPath.row].name else { return }
        presenter.pushToNewsArticles(sources: sourcesName)
    }
    
}

