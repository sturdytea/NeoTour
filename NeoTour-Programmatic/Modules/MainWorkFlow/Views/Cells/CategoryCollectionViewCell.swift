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
        button.titleLabel?.font = UIFont.customFont(.regular, size: 16)
        button.tintColor = .primaryColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.sizeToFit()
        var buttonConfig = UIButton.Configuration.plain()
        button.configuration = buttonConfig
        return button
    }()
    
    private lazy var selectedTitlePoint: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryColor
        view.isHidden = true
        view.layer.cornerRadius = 3.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        addSubview(selectedTitlePoint)
    }
    
    func configureCell(categoryName: String) {
        title.setTitle(categoryName, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
