//
//  CategoryCollectionViewCell.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private let title: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .none
        button.contentHorizontalAlignment = .leading
        button.frame.size.height = 39
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Light", size: 16) // TODO: Establish Fonts
        button.tintColor = UIColor(red: 106/255.0, green: 98/255.0, blue: 183/255.0, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonConfig = UIButton.Configuration.plain()
        button.configuration = buttonConfig
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        addSubview(title)
    }
    
    func configureCell(categoryName: String) {
        title.setTitle(categoryName, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
