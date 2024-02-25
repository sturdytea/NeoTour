//
//  TourViewModel.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 25.02.2024.
//

import Foundation

class TourViewModel: NSObject {
    private var networkService: NetworkServiceWithCompletions!
    private(set) var tourData: TourResults.Tour! {
        didSet {
            self.bindTourViewModelController()
        }
    }
    
    var bindTourViewModelController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.networkService = NetworkServiceWithCompletions()
        callFunctionToGetTourData()
    }
    
    func callFunctionToGetTourData() {
        self.networkService.fetchTours { (tourData) in
            print(tourData)
        }
    }
}
