//
//  Place.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 20.02.2024.
//

import Foundation

struct TourResults: Decodable {
    let tours: [Tour]
    
    struct Tour: Decodable {
        let id: Int
        let name: String
        let category: Category
        let location: String
        let photoUrl: String
        let description: String
        let reviews: [Review]
    }
}
