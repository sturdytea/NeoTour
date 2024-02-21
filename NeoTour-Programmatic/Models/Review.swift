//
//  Review.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 20.02.2024.
//

import Foundation

struct Review {
    let reviewer: String
    let photo: String
    let review: String
    
    init(reviewer: String, photo: String, review: String) {
        self.reviewer = reviewer
        self.photo = photo
        self.review = review
    }
    
    init(review: String) {
        self.reviewer = "Anonymous"
        self.photo = "avatar-default"
        self.review = review
    }
}
