//
//  Review.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 20.02.2024.
//

import Foundation

struct Review: Decodable {
    let id: Int
    let authorNickname: String
    let authorPhoto: String
    let text: String
}
