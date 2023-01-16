//
//  NewsArticlesRequest.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Foundation

struct NewsArticlesRequest: Request {
    
    let sources: String
    let keyword: String
    let page: Int
    
    var url: String {
        let baseURL: String = Constants.baseUrl + "top-headlines"
        return baseURL
    }
    
    var queryItems: [String : String] {
        return [
            "apiKey": Constants.defaultApiKey,
            "sources": sources,
            "q": keyword,
            "page": "\(page)",
            "pageSize": "20",
        ]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> NewsArticlesModel {
        let decoder = JSONDecoder()
        let response = try decoder.decode(NewsArticlesModel.self, from: data)
        return response
    }
}

