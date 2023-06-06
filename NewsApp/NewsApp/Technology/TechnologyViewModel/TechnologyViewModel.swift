//
//  TechnologyViewModel.swift
//  NewsApp
//
//  Created by Даниил Павленко on 06.06.2023.
//

import Foundation

final class TechnologyViewModel: NewsListViewModel {

    override func loadData(searchText: String?) {
        super.loadData()
        ApiManager.getNews(from: .technology, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
}
