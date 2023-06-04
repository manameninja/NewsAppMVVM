//
//  BusinessViewController.swift
//  NewsApp
//
//  Created by Даниил Павленко on 27.05.2023.
//

import UIKit
import SnapKit

class BusinessViewController: UIViewController {
    
    // MARK: - GUI Variables
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 20,
                                           left: 20,
                                           bottom: 20,
                                           right: 20)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        
        //Realization datasource delegate with ViewController
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Methods
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.register(GeneralCollectionViewCell.self, forCellWithReuseIdentifier: "GeneralCollectionViewCell")
        collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: "DetailsCollectionViewCell")
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.bottom.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension BusinessViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? 1 : 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell?
        
        if indexPath.section == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewCell", for: indexPath) as? GeneralCollectionViewCell
            
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionViewCell", for: indexPath) as? DetailsCollectionViewCell
        }
        
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension BusinessViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //navigationController?.pushViewController(NewsViewController(), animated: true)
    }
}

// MARK: -
extension BusinessViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let firstSectionItemSize = CGSize(width: width, height: width)
        let secondSectionItemSize = CGSize(width: width, height: 100)
        
        return indexPath.section == 0 ? firstSectionItemSize : secondSectionItemSize
    }
}
