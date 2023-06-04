//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Даниил Павленко on 29.05.2023.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    var reloadCell: ((Int) -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadCell: ((Int) -> Void)?
    
    var showError: ((String) -> Void)?
    
    var reloadData: (() -> Void)?
    
    // MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    
    private var articles: [ArticleCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    // MARK: - Life Cycle
    init() {
        loadData()
    }
    
    
    // MARK: - Methods
    func getArticle(for row: Int) -> ArticleCellViewModel {
        return articles[row]
    }
    
    // MARK: - Private methods
    private func loadImage() {
//        guard let url = URL(string: articles[row].imageUrl), let data = try? Data(contentsOf: url) else { return }
        for (index, article) in articles.enumerated() {
            ApiManager.getImageData(url: article.imageUrl) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self?.articles[index].imageData = data
                        self?.reloadCell?(index)
                    case .failure(let error):
                        self?.showError?(error.localizedDescription)
                        print(error)
                    }
                }
            }
        }
    }
    
    private func loadData() {
        ApiManager.getNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                self.articles = self.convertToCellViewModel(articles)
                loadImage()
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                    print(error)
                }
            }
        }
    }
    
    private func convertToCellViewModel(_ articles: [ArticleResponseObject]) -> [ArticleCellViewModel] {
        return articles.map { ArticleCellViewModel(article: $0) }
    }
    
    private func setupMockObjects() {
        articles = [
            ArticleCellViewModel(article: ArticleResponseObject(title: "First title",
                                                                description: "First description",
                                                                urlToImage: "First url image", date: "30.06.2001"))
        ]
    }
}
