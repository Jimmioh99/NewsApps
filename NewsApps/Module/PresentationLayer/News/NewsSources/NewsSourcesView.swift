//
//  NewsSourcesView.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import UIKit
import SnapKit

final class NewsSourcesView: UIView {
    
    lazy var categoryCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: String(describing: CategoryCollectionCell.self))
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    lazy var newsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(NewsSourcesTableCell.self, forCellReuseIdentifier: String(describing: NewsSourcesTableCell.self))
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func setupConstraints() {
        
        setupSubviews([categoryCollection, newsTable])
        
        categoryCollection.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(40)
        }
        
        newsTable.snp.makeConstraints { make in
            make.top.equalTo(categoryCollection.snp.bottom).offset(10)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
