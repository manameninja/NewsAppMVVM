//
//  NetworkingError.swift
//  NewsApp
//
//  Created by Даниил Павленко on 29.05.2023.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
