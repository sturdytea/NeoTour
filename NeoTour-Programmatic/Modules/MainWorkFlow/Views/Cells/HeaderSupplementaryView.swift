//
//  HeaderSupplementaryView.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 20.02.2024.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.heavy, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .none
        configure()
        setupConstraints()
    }
    
    private func configure() {
        addSubview(headerLabel)
    }
    
    func configureHeader(name: String) {
        headerLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderSupplementaryView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            headerLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        ])
    }

}
