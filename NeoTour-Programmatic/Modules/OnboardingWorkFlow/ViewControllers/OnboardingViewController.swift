//
//  ViewController.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private lazy var onboardingView = OnboardingView()
    
    override func loadView() {
        view = onboardingView
    }
    
//    init(viewModel: ViewModelProtocol) {
//        self.viewModel = viewModel
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
}

