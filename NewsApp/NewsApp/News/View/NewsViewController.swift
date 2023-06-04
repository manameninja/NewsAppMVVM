//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Даниил Павленко on 28.05.2023.
//

import UIKit
import SnapKit

final class NewsViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView = UIView()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
    
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        return label
    }()
    
    // MARK: - Properties
    private let edgeInset = 10
    private let viewModel: NewsViewModelProtocol
    
    // MARK: - Life Cycle
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(descriptionLabel)
        view.addSubview(scrollView)
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        
        if let data = viewModel.imageData, let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "image") ?? UIImage.add
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(view.snp.width)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(edgeInset)
            make.leading.trailing.equalToSuperview().inset(edgeInset)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(edgeInset)
            make.leading.trailing.equalToSuperview().inset(edgeInset)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(edgeInset)
            make.leading.trailing.equalToSuperview().inset(edgeInset)
            make.bottom.equalToSuperview().inset(edgeInset)
        }
        
    }
}
