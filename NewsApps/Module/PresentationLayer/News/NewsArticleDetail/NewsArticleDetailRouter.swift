//
//  NewsArticleDetailRouter.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Swinject

protocol NewsArticleDetailRouterDelegate: AnyObject {
    func set(navigator: Navigator)
    func pushToNewsArticles()
}

final class NewsArticleDetailRouter: NewsArticleDetailRouterDelegate {
    var navigator: Navigator?
    
    func set(navigator: Navigator) {
        self.navigator = navigator
    }
    
    func pushToNewsArticles() {
        let vc = Assembler.sharedAssembler.resolver.resolve(NewsArticlesViewControllerDelegate.self)!
        navigator?.push(viewController: vc)
    }
    
}
