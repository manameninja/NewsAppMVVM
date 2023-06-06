//
//  TableCollectionViewSection.swift
//  NewsApp
//
//  Created by Даниил Павленко on 04.06.2023.
//

import Foundation

protocol TableCollectionViewItemsProtocol { }

struct TableCollectionViewSection {
    var title: String?
    var items: [TableCollectionViewItemsProtocol]
}
