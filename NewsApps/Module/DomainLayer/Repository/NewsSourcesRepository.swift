//
//  NewsSourcesRepository.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Foundation

protocol NewsSourcesRepository {
    func getNewsSources(category: CategoryType, _ callback: @escaping (Result<NewsSourcesModel, Error>) -> Void)
}
