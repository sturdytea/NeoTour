//
//  BookingRequest.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 25.02.2024.
//

import Foundation

struct BookingRequest: Codable {
    let id: Int
    let comments: String
    let numberOfPeople: Int
    let phoneNumber: String
    
    #warning("TODO: Rewrite in Network Service")
    var dto: BookingRequestDTO {
        let dto = BookingRequestDTO(comments: comments, numberOfPeople: numberOfPeople, phoneNumber: phoneNumber)
        return dto
    }
    
    struct BookingRequestDTO {
        let comments: String
        let numberOfPeople: Int
        let phoneNumber: String
    }
}
