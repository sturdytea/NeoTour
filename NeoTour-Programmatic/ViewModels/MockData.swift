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
            .init(name: "Northern Mountain", image: "northern-mountain"),
            .init(name: "Mount Fuji", image: "mount-fuji"),
        ])
    }()

    private let recommended: ListSection = {
        .recommended([
            .init(name: "Greenough Montana", image: "greenough-montana"),
            .init(name: "Razek's House", image: "razeks-house"),
            .init(name: "Alta, Norway", image: "alta-norway"),
            .init(name: "Guilin, China", image: "guilin-china"),
        ])
    }()
    
//    private let reviews

    var pageData: [ListSection] {
        [category, places, recommended]
    }
}
