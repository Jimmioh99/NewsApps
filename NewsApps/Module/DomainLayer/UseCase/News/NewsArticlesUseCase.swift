//
//  NewsArticlesUseCase.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Foundation

protocol NewsArticlesUseCase: AnyObject {
    func start(sources: String, keyword: String, page: Int, _ callback: @escaping (Result<NewsArticlesModel, Error>) -> Void)
}

public final class NewsArticlesUseCaseImpl {
    private var repository: NewsArticlesRepository
    
    init(repository: NewsArticlesRepository) {
        self.repository = repository
    }
}

extension NewsArticlesUseCaseImpl: NewsArticlesUseCase {
    func start(sources: String, keyword: String, page: Int, _ callback: @escaping (Result<NewsArticlesModel, Error>) -> Void) {
        repository.getNewsArticles(sources: sources, keyword: keyword, page: page) { response in
            DispatchQueue.main.sync {
                callback(response)
            }
        }
    }
}
