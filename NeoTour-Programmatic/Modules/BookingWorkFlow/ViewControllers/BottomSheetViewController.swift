//
//  BottomSheetViewController.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 22.02.2024.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    private lazy var bottomSheetView = BottomSheetView()
    
    override func loadView() {
        view = bottomSheetView
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        bottomSheetView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        let alertViewController = AlertViewController()
        alertViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        alertViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(alertViewController, animated: true)
    }
}
