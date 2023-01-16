//
//  PresentationAssembly.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import Swinject

final class PresentationAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: - Navigator
        container.register(Navigator.self) { r, view in
            NavigatorImpl(viewController: view)
        }
        
        // MARK: - NewsSourcesScreen
        container.register(NewsSourcesPresenterDelegate.self) { r in
            NewsSourcesPresenter(router: r.resolve(NewsSourcesRouterDelegate.self)!)
        }
        container.register(NewsSourcesRouterDelegate.self) { r in
            NewsSourcesRouter()
        }
        container.register(NewsSourcesViewControllerDelegate.self) { r in
            let router = r.resolve(NewsSourcesRouterDelegate.self)!
            let presenter = r.resolve(NewsSourcesPresenterDelegate.self)!

            let view = NewsSourcesViewController(presenter: presenter)
            let navigator = r.resolve(Navigator.self, argument: view as UIViewController)!
            router.set(navigator: navigator)
            presenter.set(vc: view)
            return view
        }
        
        // MARK: - NewsArticlesScreen
        container.register(NewsArticlesPresenterDelegate.self) { r in
            NewsArticlesPresenter(router: r.resolve(NewsArticlesRouterDelegate.self)!)
        }
        container.register(NewsArticlesRouterDelegate.self) { r in
            NewsArticlesRouter()
        }
        container.register(NewsArticlesViewControllerDelegate.self) { r, sources in
            let router = r.resolve(NewsArticlesRouterDelegate.self)!
            let presenter = r.resolve(NewsArticlesPresenterDelegate.self)!

            let view = NewsArticlesViewController(presenter: presenter, sources: sources)
            let navigator = r.resolve(Navigator.self, argument: view as UIViewController)!
            router.set(navigator: navigator)
            presenter.set(vc: view)
            return view
        }
        
        // MARK: - NewsArticleDetailScreen
        container.register(NewsArticleDetailPresenterDelegate.self) { r in
            NewsArticleDetailPresenter(router: r.resolve(NewsArticleDetailRouterDelegate.self)!)
        }
        container.register(NewsArticleDetailRouterDelegate.self) { r in
            NewsArticleDetailRouter()
        }
        container.register(NewsArticleDetailViewControllerDelegate.self) { r, url in
            let router = r.resolve(NewsArticleDetailRouterDelegate.self)!
            let presenter = r.resolve(NewsArticleDetailPresenterDelegate.self)!

            let view = NewsArticleDetailViewController(presenter: presenter, url: url)
            let navigator = r.resolve(Navigator.self, argument: view as UIViewController)!
            router.set(navigator: navigator)
            presenter.set(vc: view)
            return view
        }
    }
}
