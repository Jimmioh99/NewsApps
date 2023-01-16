//
//  NewsSourcesRequest.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import Foundation

struct NewsSourcesRequest: Request {
    
    let category: CategoryType
    
    var url: String {
        let baseURL: String = Constants.baseUrl + "top-headlines/sources"
        return baseURL
    }
    
    var queryItems: [String : String] {
        return [
            "apiKey": Constants.defaultApiKey,
            "category": category.rawValue,
        ]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> NewsSourcesModel {
        let decoder = JSONDecoder()
        let response = try decoder.decode(NewsSourcesModel.self, from: data)
        return response
    }
}

