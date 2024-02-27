//
//  NetworkService.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 25.02.2024.
//

import Foundation

class NetworkServiceWithCompletions {
    static let shared = NetworkServiceWithCompletions()
    
    init() {}
    
    func fetchTours(completion: @escaping (Result<TourResults, Error>) -> ()) {
        guard let url = URLManager.shared.createURL(endPoint: .getTours, id: nil) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let toursData = try decoder.decode(TourResults.self, from: data)
                completion(.success(toursData))
                
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }.resume()
    }
    
    func fetchTourDetails(id: Int, completion: @escaping (Result<TourResults.Tour, Error>) -> ()) {
        guard let url = URLManager.shared.createURL(endPoint: .getTours, id: id) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let tourDetailsData = try decoder.decode(TourResults.Tour.self, from: data)
                completion(.success(tourDetailsData))
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }.resume()
    }
    
    #warning("TODO: Add filterByCategories function")
    #warning("TODO: Add fetchRecommendedTours function")
}
