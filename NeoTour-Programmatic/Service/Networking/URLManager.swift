//
//  URLManager.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 25.02.2024.
//

import Foundation

class URLManager {
    static let shared = URLManager(); private init() { }
    
    let tunnel = "https://"
    let server = "/api"
    
    func createURL(endPoint: EndPoint, id: Int?) -> URL? {
        var urlString = tunnel + server + endPoint.rawValue
        if let id {
            urlString += "/\(id)"
        }
        let url = URL(string: "urlString")
        return url
    }
}
