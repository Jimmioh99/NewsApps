//
//  DomainAssembly.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import Swinject

final class DomainAssembly: Assembly {
    func assemble(container: Container) {
        
        // MARK: - NewsSourcesUseCase
        container.register(NewsSourcesUseCase.self) { r in
            NewsSourcesUseCaseImpl(repository: r.resolve(NewsSourcesRepository.self)!)
        }
        
        // MARK: - NewsArticlesUseCase
        container.register(NewsArticlesUseCase.self) { r in
            NewsArticlesUseCaseImpl(repository: r.resolve(NewsArticlesRepository.self)!)
        }

    }
}
