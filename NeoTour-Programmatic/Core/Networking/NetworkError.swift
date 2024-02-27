//
//  NetworkError.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 25.02.2024.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badRequest
    case badResponse
    case invalidData
}
