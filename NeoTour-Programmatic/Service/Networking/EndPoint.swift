//
//  EndPoint.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 25.02.2024.
//

import Foundation

enum EndPoint: String {
    case bookingRequest = "/booking-request"
    case bookingRequestByTour = "/booking-request/by-tour"
    case tourReviews = "/tour-reviews"
    case tourReviewsByTour = "/tour-reviews/by-tour"
    case tours = "/tours"
    case tourCategories = "/tour-categories"
}
