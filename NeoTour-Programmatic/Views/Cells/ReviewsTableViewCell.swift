//
//  ReviewsTableViewCell.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 21.02.2024.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {

    static let identifier = "ReviewsTableViewCell"
    
    let subtitle: UILabel = {
        let title = UILabel()
        title.text = "Title text dfdf"
        return title
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(subtitle)
        setupConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension ReviewsTableViewCell {
    private func setupConstraints() {}
}
