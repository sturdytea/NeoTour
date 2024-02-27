//
//  EndPoint.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 25.02.2024.
//

import Foundation

enum EndPoint: String {
    case getBookingRequest = "/booking-request"
    case getBookingRequestByTour = "/booking-request/by-tour"
    case gettourReviews = "/tour-reviews"
    case getTourReviewsByTour = "/tour-reviews/by-tour"
    case getTours = "/tours"
    case getTourCategories = "/tour-categories"
}
