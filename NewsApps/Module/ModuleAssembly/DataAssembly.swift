//
//  DataAssembly.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import Swinject

final class DataAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: - UrlSessionImpl
        container.register(NetworkService.self) { r in
            URLSessionNetworkService()
        }
        
        // MARK: - NewsSourcesRepository
        container.register(NewsSourcesRepository.self) { r in
            NewsSourcesService(networkService: r.resolve(NetworkService.self)!)
        }
        
        // MARK: - NewsArticlesRepository
        container.register(NewsArticlesRepository.self) { r in
            NewsArticlesService(networkService: r.resolve(NetworkService.self)!)
        }
    }
}
