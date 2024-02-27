//
//  UIFont.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 28.02.2024.
//

import UIKit

extension UIFont {
    enum CustomFont: String {
        case black = "SFProDisplay-Black"
        case bold = "SFProDisplay-Bold"
        case heavy = "SFProDisplay-Heavy"
        case light = "SFProDisplay-Light"
        case medium = "SFProDisplay-Medium"
        case regular = "SFProDisplay-Regular"
        case semibold = "SFProDisplay-Semibold"
        case thin = "SFProDisplay-Thin"
        case ultralight = "SFProDisplay-Ultralight"
    }
    
    static func customFont(_ type: CustomFont, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font 
    }
}
