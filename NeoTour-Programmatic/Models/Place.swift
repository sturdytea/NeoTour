//
//  Place.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 20.02.2024.
//

import Foundation

struct Place {
    let name: String
    let location: String
    let imageName: String
    let description: String
    var reviews: [Review]
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
        
        location = ""
        description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes."
        reviews = [Review]()
    }
}
