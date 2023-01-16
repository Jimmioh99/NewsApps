//
//  NewsSourcesUseCase.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Foundation

protocol NewsSourcesUseCase: AnyObject {
    func start(category: CategoryType, _ callback: @escaping (Result<NewsSourcesModel, Error>) -> Void)
}

public final class NewsSourcesUseCaseImpl {
    private var repository: NewsSourcesRepository
    
    init(repository: NewsSourcesRepository) {
        self.repository = repository
    }
}

extension NewsSourcesUseCaseImpl: NewsSourcesUseCase {
    func start(category: CategoryType, _ callback: @escaping (Result<NewsSourcesModel, Error>) -> Void) {
        repository.getNewsSources(category: category) { response in
            DispatchQueue.main.sync {
                callback(response)
            }
        }
    }
}
