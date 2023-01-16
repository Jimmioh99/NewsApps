//
//  NewsArticlesViewController.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import UIKit

protocol NewsArticlesViewControllerDelegate: UIViewController {
    func successGetNewsArticles(data: [NewsArticlesMediaModel])
    func failureGetNewsArticles(error: Error)
}


final class NewsArticlesViewController: UIViewController {
    private let presenter: NewsArticlesPresenterDelegate
    private lazy var root: NewsArticlesView = NewsArticlesView()
    
    private var dataArr: [NewsArticlesMediaModel] = []
    
    private var page: Int = 1
    
    private var isLoadingList: Bool = false
    
    private let sources: String
    
    init(presenter: NewsArticlesPresenterDelegate, sources: String) {
        self.presenter = presenter
        self.sources = sources
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setDelegate()
        
        getNewsArticles()
    }
    
    private func setDelegate() {
        root.newsTable.delegate = self
        root.newsTable.dataSource = self
        
        root.searchBar.delegate = self
    }
    
    private func getNewsArticles(keyword: String = "") {
        if !isLoadingList {
            presenter.getNewsArticles(sources: sources, keyword: keyword, page: page)
            page += 1
            isLoadingList = true
        }
    }
    
    private func reloadTable(data: [NewsArticlesMediaModel], isReload: Bool = true) {
        if data.count >= 20 {
            isLoadingList = false
        }
        
        if isReload {
            self.dataArr = data
        } else {
            self.dataArr.append(contentsOf: data)
        }
        
        DispatchQueue.main.async {
            self.root.newsTable.reloadData()
        }
    }
}

extension NewsArticlesViewController: NewsArticlesViewControllerDelegate {
    func successGetNewsArticles(data: [NewsArticlesMediaModel]) {
        reloadTable(data: data, isReload: page <= 2)
    }
    
    func failureGetNewsArticles(error: Error) {
        // Should handler if got Error
        print(error)
    }
    
    
}

extension NewsArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count == 0 ? 1 : dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsArticlesTableCell.self), for: indexPath) as! NewsArticlesTableCell
        if dataArr.count == 0 {
            cell.setupCell(image: UIImage(named: "ic_no_data"), title: "No Data", content: "Check news from another sources")
        } else {
            let data = dataArr[indexPath.row]
            cell.setupCell(model: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard dataArr.count != 0 else { return }
        guard let url = dataArr[indexPath.row].url else { return }
        presenter.pushToNewsArticleDetail(url: url)
    }
    
}

extension NewsArticlesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoadingList){
            getNewsArticles()
        }
    }
}

extension NewsArticlesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getNewsArticles(keyword: searchText)
    }
}

