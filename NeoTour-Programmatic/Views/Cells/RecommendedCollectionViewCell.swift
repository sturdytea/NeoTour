//
//  RecommendedCollectionViewCell.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

class RecommendedCollectionViewCell: UICollectionViewCell {
    
    private let image: UIButton = {
        let button = UIButton()
        
        button.contentMode = .scaleAspectFill
        button.frame.size.width = 185
        button.frame.size.height = 185
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private let backgroundTitleView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupConstraints()
    }
    
    private func configure() {
        clipsToBounds = true
        addSubview(image)
        image.addSubview(backgroundTitleView)
        image.addSubview(titleLabel)
    }
    
    func configureCell(imageName: String, title: String) {
        image.setImage(UIImage(named: imageName), for: .normal)
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendedCollectionViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),

            backgroundTitleView.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: 0),
            backgroundTitleView.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: 0),
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.06),
        ])
    }
}
