//
//  PlaceViewController.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 20.02.2024.
//

import UIKit

class PlaceViewController: UIViewController {

    private lazy var placeView = PlaceView()
    
    var selectedItemIndexPath: IndexPath?
    
    override func loadView() {
        view = placeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
        extendedLayoutIncludesOpaqueBars = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        placeView.tableView.frame = view.bounds 
    }
}
