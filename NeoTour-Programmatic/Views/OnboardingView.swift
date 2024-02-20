//
//  OnboardingView.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

class OnboardingView: UIView {
    
    let image = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let button = CustomImageButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configure()
    }
    
    func configure() {
        configureImage()
        configureLabels()
        configureButton()
        setupConstraints()
    }
    
    func configureImage() {
        addSubview(image)
        image.image = UIImage(named: "onboarding")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
    }
    
    func configureLabels() {
        // TitleLabel
        addSubview(titleLabel)
        titleLabel.text = "Winter\nVacation Trips"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "SFProDisplay-Heavy", size: 40)
        
        titleLabel.numberOfLines = 0
        
        // DescriptionLabel
        addSubview(descriptionLabel)
        descriptionLabel.text = "Enjoy your winter vacations with warmth \nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        descriptionLabel.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        
        let attributedString = NSAttributedString(string: descriptionLabel.text!, attributes: [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        
        descriptionLabel.attributedText = attributedString
    }
    
    func configureButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Let's Go!", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            image.widthAnchor.constraint(equalToConstant: 393),
            image.topAnchor.constraint(equalTo: topAnchor, constant: -15),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            button.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            button.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 47)
        ])
    }
}
