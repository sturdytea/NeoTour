//
//  OnboardingView.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

class OnboardingView: UIView {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "onboarding")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.black, size: 40)
        label.numberOfLines = 0
        label.text = "Winter\nVacation Trips"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.regular, size: 16)
        label.numberOfLines = 0
        label.text = "Enjoy your winter vacations with warmth \nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!"
        label.translatesAutoresizingMaskIntoConstraints = false
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        let attributedString = NSAttributedString(string: label.text!, attributes: [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        label.attributedText = attributedString
        return label
    }()
    
    let button: CustomPrimaryButton = {
        let button = CustomPrimaryButton()
        let arrowImage = UIImage(systemName: "arrow.right")
        let coloredArrowImage = arrowImage?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal)
        button.configuration?.imagePadding = 20
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font.withSize(16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.semanticContentAttribute = .forceRightToLeft
        button.setImage(coloredArrowImage, for: .normal)
        button.setTitle("Let's Go!", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(image)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(button)
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
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 33),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            button.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            button.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 47)
        ])
    }
}
