//
//  NewsSourcesPresenter.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import Swinject

protocol NewsSourcesPresenterDelegate: AnyObject {
    func set(vc: NewsSourcesViewControllerDelegate)
    
    func getNewsSources(category: CategoryType)
    
    func pushToNewsArticles(sources: String)
}

final class NewsSourcesPresenter: NewsSourcesPresenterDelegate {
    
    weak var vc: NewsSourcesViewControllerDelegate?
    private let router: NewsSourcesRouterDelegate
    
    init(router: NewsSourcesRouterDelegate) {
        self.router = router
    }
    
    func set(vc: NewsSourcesViewControllerDelegate) {
        self.vc = vc
    }
    
    func getNewsSources(category: CategoryType) {
        guard let newsSourcesUseCase = Assembler.sharedAssembler.resolver.resolve(NewsSourcesUseCase.self) else { return }
        newsSourcesUseCase.start(category: category) { [weak self] response  in
            switch response{
                case .success(let model):
                self?.vc?.successGetNewsSources(data: model.sources)
                case .failure(let error):
                self?.vc?.failureGetNewsSources(error: error)
            }
        }
    }
    
    func pushToNewsArticles(sources: String) {
        router.pushToNewsArticles(sources: sources)
    }
    
}

