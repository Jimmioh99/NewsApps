//
//  NewsArticlesService.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Foundation

final class NewsArticlesService {
    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension NewsArticlesService: NewsArticlesRepository {
    func getNewsArticles(sources: String, keyword: String, page: Int, _ callback: @escaping (Result<NewsArticlesModel, Error>) -> Void) {
        let request = NewsArticlesRequest(sources: sources, keyword: keyword, page: page)
        networkService.request(request, completion: callback)
    }
}
