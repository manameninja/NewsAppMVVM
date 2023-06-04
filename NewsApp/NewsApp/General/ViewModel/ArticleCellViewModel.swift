//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Даниил Павленко on 29.05.2023.
//

import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    var imageData: Data?
    var imageUrl: String
    
    init(article: ArticleResponseObject) {
        title = article.title
        description = article.description
        date = article.date
        imageUrl = article.urlToImage
    }
}
