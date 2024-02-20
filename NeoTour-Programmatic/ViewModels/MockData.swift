//
//  MockData.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import Foundation

struct MockData {

    static let shared = MockData()
    
    private let category: ListSection = {
        .category([
            .init(name: "Popular", image: ""),
            .init(name: "Featured", image: ""),
            .init(name: "Most Visited", image: ""),
            .init(name: "Europe", image: ""),
            .init(name: "Asia", image: ""),
        ])
    }()
    
    private let places: ListSection = {
        .places([
            .init(name: "Mount Fuji", image: "mount-fuji"),
            .init(name: "Mount Fuji", image: "mount-fuji"),
        ])
    }()

    private let recommended: ListSection = {
        .recommended([
            .init(name: "Mount1 Fuji", image: "mount-fuji"),
            .init(name: "Mount2 Fuji", image: "onboarding"),
            .init(name: "Mount3 Fuji", image: "mount-fuji"),
        ])
    }()

    var pageData: [ListSection] {
        [category, places, recommended]
    }
}
