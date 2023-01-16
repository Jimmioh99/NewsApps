//
//  NewsArticlesView.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import UIKit
import SnapKit

final class NewsArticlesView: UIView {
    
    lazy var searchBar: UISearchBar = {
        let uiSearchBar = UISearchBar()
        return uiSearchBar
    }()
    
    lazy var newsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(NewsArticlesTableCell.self, forCellReuseIdentifier: String(describing: NewsArticlesTableCell.self))
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
        
        setupSubviews([searchBar, newsTable])
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
        }
        
        newsTable.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
