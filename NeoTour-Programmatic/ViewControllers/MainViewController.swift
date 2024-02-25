//
//  MainViewController.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var mainView = MainView()
    private var tourViewModel: TourViewModel!
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Discover"
        
        // TODO: Establish Font: UIFont(name: "SFProDisplay-Heavy", size: 32)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        callToViewModelForUpdate()
    }
    
    func callToViewModelForUpdate() {
        self.tourViewModel = TourViewModel()
        self.tourViewModel.bindTourViewModelController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        DispatchQueue.main.async {
            #warning("TODO: Finish update UI")
        }
    }
}
