//
//  NewsSourcesRouter.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import Swinject

protocol NewsSourcesRouterDelegate: AnyObject {
    func set(navigator: Navigator)
    func pushToNewsArticles(sources: String)
}

final class NewsSourcesRouter: NewsSourcesRouterDelegate {
    var navigator: Navigator?
    
    func set(navigator: Navigator) {
        self.navigator = navigator
    }
    
    func pushToNewsArticles(sources: String) {
        let vc = Assembler.sharedAssembler.resolver.resolve(NewsArticlesViewControllerDelegate.self, argument: sources)!
        navigator?.push(viewController: vc)
    }
    
}
