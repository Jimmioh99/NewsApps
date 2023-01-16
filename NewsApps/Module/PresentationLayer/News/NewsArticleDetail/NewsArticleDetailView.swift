//
//  NewsArticleDetailView.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import UIKit
import SnapKit
import WebKit

final class NewsArticleDetailView: UIView {
    
    lazy var webView: WKWebView = {
        let web = WKWebView()
        return web
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
        
        addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
