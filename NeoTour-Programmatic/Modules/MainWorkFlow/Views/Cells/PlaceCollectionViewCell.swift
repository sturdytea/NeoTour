//
//  PlaceCollectionViewCell.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    
    let image: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
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
        label.font = UIFont.customFont(.semibold, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.addSubview(image)
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

extension PlaceCollectionViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),

            backgroundTitleView.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: 0),
            backgroundTitleView.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: 0),
            backgroundTitleView.heightAnchor.constraint(equalTo: image.heightAnchor, multiplier: 0.2),
        ])
    }
}
