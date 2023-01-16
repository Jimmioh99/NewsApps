//
//  NewsArticleDetailPresenter.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Swinject

protocol NewsArticleDetailPresenterDelegate: AnyObject {
    func set(vc: NewsArticleDetailViewControllerDelegate)
}

final class NewsArticleDetailPresenter: NewsArticleDetailPresenterDelegate {
    
    weak var vc: NewsArticleDetailViewControllerDelegate?
    private let router: NewsArticleDetailRouterDelegate
    
    init(router: NewsArticleDetailRouterDelegate) {
        self.router = router
    }
    
    func set(vc: NewsArticleDetailViewControllerDelegate) {
        self.vc = vc
    }
    
    func pushToNewsArticles() {
        router.pushToNewsArticles()
    }
    
}

