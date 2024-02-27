//
//  ModalWindowViewController.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 27.02.2024.
//

import UIKit

class AlertViewController: UIViewController {
    
    private lazy var alertWindow = AlertWindow()
    
    override func loadView() {
        view = alertWindow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertWindow.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        dismiss(animated: true)
    }
}
