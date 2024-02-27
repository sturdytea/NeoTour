//
//  CustomPrimaryButton.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

class CustomPrimaryButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        backgroundColor = .primaryColor
        contentHorizontalAlignment = .center
        tintColor = .white
        titleLabel?.font = UIFont.customFont(.medium, size: 18)
        setTitleColor(.white, for: .normal)
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 17, leading: 30, bottom: 17, trailing: 30)
        configuration = buttonConfig
        frame.size.height = 53
        layer.cornerRadius = frame.size.height / 2.0
        layer.masksToBounds = false
    }
    
    override var isEnabled: Bool {
        didSet {
            if self.isEnabled == false {
                backgroundColor = .secondaryColor
            } else {
                backgroundColor = .primaryColor
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
}
