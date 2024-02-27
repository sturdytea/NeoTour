//
//  ModalWindow.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 27.02.2024.
//

import UIKit

class AlertWindow: UIView {
    
    let alertCard: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 28
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let message: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.bold, size: 24)
        label.text = "Message"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: CustomPrimaryButton = {
        let button = CustomPrimaryButton()
        button.isEnabled = true
        button.setTitle("Ok", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black.withAlphaComponent(0.2)
        configure()
        setupConstraints()
    }
    
    private func configure() {
        clipsToBounds = true
        addSubview(alertCard)
        alertCard.addSubview(message)
        alertCard.addSubview(button)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlertWindow {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            alertCard.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            alertCard.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            alertCard.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -60),
            alertCard.heightAnchor.constraint(equalToConstant: 191),
            
            message.centerXAnchor.constraint(equalTo: alertCard.centerXAnchor),
            message.topAnchor.constraint(equalTo: alertCard.topAnchor, constant: 40),
            
            button.leadingAnchor.constraint(equalTo: alertCard.leadingAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: alertCard.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: alertCard.bottomAnchor, constant: -40)
        ])
    }
}
