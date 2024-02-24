//
//  ModalPopupView.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 24.02.2024.
//

import UIKit

class ModalPopupView: UIView {
    
    var modalWindow = ModalWindow()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .none
        configure()
        setupConstraints()
    }
    
    private func configure() {
        addSubview(modalWindow)
//        modalWindow.frame.size.height = 191
        modalWindow.layer.cornerRadius = 28
        modalWindow.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ModalPopupView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            modalWindow.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            modalWindow.heightAnchor.constraint(equalToConstant: 191),
            modalWindow.centerXAnchor.constraint(equalTo: centerXAnchor),
            modalWindow.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

class ModalWindow: UIView {
    let message: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 24)
        label.text = "Message"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: CustomPrimaryButton = {
        let button = CustomPrimaryButton()
        button.setTitle("Ok", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configure()
        setupConstraints()
    }
    
    private func configure() {
        addSubview(message)
        addSubview(button)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ModalWindow {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            message.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            message.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
}
