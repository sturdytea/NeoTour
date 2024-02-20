//
//  MainViewController.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Discover"
        
        // TODO: Establish Font: UIFont(name: "SFProDisplay-Heavy", size: 32)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    // TODO: Init Buttons' Actions 
}
