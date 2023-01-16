//
//  NewsArticleDetailViewController.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import UIKit

protocol NewsArticleDetailViewControllerDelegate: UIViewController {}

final class NewsArticleDetailViewController: UIViewController {
    private let presenter: NewsArticleDetailPresenterDelegate
    private lazy var root: NewsArticleDetailView = NewsArticleDetailView()
    
    private let url: String
    
    init(presenter: NewsArticleDetailPresenterDelegate, url: String) {
        self.presenter = presenter
        self.url = url
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        guard let url = URL(string: url) else { return }
        root.webView.load(URLRequest(url: url))
        
    }
}

extension NewsArticleDetailViewController: NewsArticleDetailViewControllerDelegate { }

