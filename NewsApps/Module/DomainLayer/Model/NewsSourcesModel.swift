//
//  NewsSourcesModel.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import Foundation

public struct NewsSourcesModel: Codable {
    let status: String?
    let sources: [NewsSourcesMediaModel]
}

public struct NewsSourcesMediaModel: Codable {
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
}
