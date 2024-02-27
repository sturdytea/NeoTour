//
//  ListSection.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import Foundation

enum ListSection {
    case category([ListItem])
    case places([ListItem])
    case recommended([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .category(let items),
            .places(let items),
            .recommended(let items) :
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .category(_):
            return ""
        case .places(_):
            return ""
        case .recommended(_):
            return "Recommended"
        }
    }
}
