//
//  DescriptionTableViewCell.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 21.02.2024.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    static let identifier = "DescriptionTableViewCell"
    
    let placeName: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.black, size: 24)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let location: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .left
        button.configuration?.imagePadding = 10
        button.setImage(UIImage(named: "map-marker"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.customFont(.medium, size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "mount-fuji")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let whiteBack: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 36
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let paragraphSubtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(.semibold, size: 20)
        label.text = "Description"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shortDescription: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes."
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1
        let attributedString = NSAttributedString(string: text.text!, attributes: [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        text.attributedText = attributedString
        text.font = UIFont.customFont(.regular, size: 16)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    public func configureCell(name title: String, location: String, imageName: String, description: String) {
        placeName.text = title
        self.location.setTitle(location, for: .normal)
        backgroundImage.image = UIImage(named: imageName)
        shortDescription.text = description
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        clipsToBounds = true
        addSubview(backgroundImage)
        backgroundImage.addSubview(whiteBack)
        whiteBack.addSubview(placeName)
        whiteBack.addSubview(self.location)
        whiteBack.addSubview(paragraphSubtitle)
        whiteBack.addSubview(shortDescription)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension DescriptionTableViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: -10),
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            whiteBack.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -40),
            whiteBack.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 1),
            whiteBack.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor),
            
            placeName.topAnchor.constraint(equalTo: whiteBack.topAnchor, constant: 24),
            placeName.leadingAnchor.constraint(equalTo: whiteBack.leadingAnchor, constant: 16),
            placeName.trailingAnchor.constraint(equalTo: whiteBack.trailingAnchor, constant: 16),
            
            location.topAnchor.constraint(equalTo: placeName.bottomAnchor, constant: 16),
            location.leadingAnchor.constraint(equalTo: placeName.leadingAnchor),
            
            paragraphSubtitle.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 20),
            paragraphSubtitle.leadingAnchor.constraint(equalTo: location.leadingAnchor),
            
            shortDescription.topAnchor.constraint(equalTo: paragraphSubtitle.bottomAnchor, constant: 16),
            shortDescription.leadingAnchor.constraint(equalTo: paragraphSubtitle.leadingAnchor),
            shortDescription.widthAnchor.constraint(equalTo: widthAnchor, constant: -32)
        ])
    }
}
