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
        bottomSheetView.button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
    }
    
    @objc func submitButtonPressed() {
        let modalPopupViewController = ModalPopupViewController()
        modalPopupViewController.modalPresentationStyle = .formSheet
        present(modalPopupViewController, animated: true)

    }
}
