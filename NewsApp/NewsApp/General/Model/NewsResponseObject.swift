//
//  NewsResponseObject.swift
//  NewsApp
//
//  Created by Даниил Павленко on 29.05.2023.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
