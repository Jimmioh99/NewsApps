//
//  NewsArticlesPresenter.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Swinject

protocol NewsArticlesPresenterDelegate: AnyObject {
    func set(vc: NewsArticlesViewControllerDelegate)
    
    func getNewsArticles(sources: String, keyword: String, page: Int)
    
    func pushToNewsArticleDetail(url: String)
}

final class NewsArticlesPresenter: NewsArticlesPresenterDelegate {
    
    weak var vc: NewsArticlesViewControllerDelegate?
    private let router: NewsArticlesRouterDelegate
    
    init(router: NewsArticlesRouterDelegate) {
        self.router = router
    }
    
    func set(vc: NewsArticlesViewControllerDelegate) {
        self.vc = vc
    }
    
    func getNewsArticles(sources: String, keyword: String, page: Int) {
        guard let newsArticlesUseCase = Assembler.sharedAssembler.resolver.resolve(NewsArticlesUseCase.self) else { return }
        newsArticlesUseCase.start(sources: sources, keyword: keyword, page: page) { [weak self] response  in
            switch response{
                case .success(let model):
                self?.vc?.successGetNewsArticles(data: model.articles)
                case .failure(let error):
                self?.vc?.failureGetNewsArticles(error: error)
            }
        }
    }
    
    func pushToNewsArticleDetail(url: String) {
        router.pushToNewsArticleDetail(url: url)
    }
    
}
