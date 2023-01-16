//
//  NewsArticlesModel.swift
//  NewsApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import Foundation

public struct NewsArticlesModel: Codable {
    let status: String?
    let articles: [NewsArticlesMediaModel]
}

public struct NewsArticlesMediaModel: Codable {
    let source: NewsArticlesMediaSourceModel?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

public struct NewsArticlesMediaSourceModel: Codable {
    let id: String
    let name: String
}
