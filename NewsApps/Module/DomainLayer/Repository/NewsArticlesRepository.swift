//
//  NewsArticlesRepository.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Foundation

protocol NewsArticlesRepository {
    func getNewsArticles(sources: String, keyword: String, page: Int, _ callback: @escaping (Result<NewsArticlesModel, Error>) -> Void)
}
