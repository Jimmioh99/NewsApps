//
//  NewsSourcesService.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Foundation

final class NewsSourcesService {
    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension NewsSourcesService: NewsSourcesRepository {
    func getNewsSources(category: CategoryType, _ callback: @escaping (Result<NewsSourcesModel, Error>) -> Void) {
        let request = NewsSourcesRequest(category: category)
        networkService.request(request, completion: callback)
    }
}
