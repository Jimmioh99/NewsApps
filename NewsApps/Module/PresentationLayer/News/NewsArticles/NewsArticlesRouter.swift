//
//  NewsArticlesRouter.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Swinject

protocol NewsArticlesRouterDelegate: AnyObject {
    func set(navigator: Navigator)
    func pushToNewsArticleDetail(url: String)
}

final class NewsArticlesRouter: NewsArticlesRouterDelegate {
    var navigator: Navigator?
    
    func set(navigator: Navigator) {
        self.navigator = navigator
    }
    
    func pushToNewsArticleDetail(url: String) {
        let vc = Assembler.sharedAssembler.resolver.resolve(NewsArticleDetailViewControllerDelegate.self, argument: url)!
        navigator?.push(viewController: vc)
    }
    
}
