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
        backgroundColor = UIColor(red: 106/255.0, green: 98/255.0, blue: 183/255.0, alpha: 1.0)
        setTitleColor(.white, for: .normal)
        tintColor = .white
    
        titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 18.0)
        
        contentHorizontalAlignment = .center
        
        // Button Configuration
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 17, leading: 30, bottom: 17, trailing: 30)
        configuration = buttonConfig

        frame.size.height = 53
        
        layer.cornerRadius = frame.size.height / 2.0
        layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

}
