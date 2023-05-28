//
//  GeneralCollectionViewCell.swift
//  NewsApp
//
//  Created by Даниил Павленко on 28.05.2023.
//

import UIKit
import SnapKit

final class GeneralCollectionViewCell: UICollectionViewCell {
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image") ?? UIImage.add
        
        return view
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.5
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Test title"
        label.textColor = .white
        
        return label
    }()
    
    //Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupUI() {
        addSubview(imageView)
        addSubview(blackView)
        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.size.edges.equalToSuperview()
        }
        
        blackView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(blackView)
            make.leading.trailing.equalTo(blackView).offset(5)
        }
    }
}