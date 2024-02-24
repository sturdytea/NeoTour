//
//  modalPopupViewController.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 24.02.2024.
//

import UIKit

class ModalPopupViewController: UIViewController {

    private lazy var modalPopupView = ModalPopupView()
    
    override func loadView() {
        view = modalPopupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalPopupView.modalWindow.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        dismiss(animated: true)
    }
}
