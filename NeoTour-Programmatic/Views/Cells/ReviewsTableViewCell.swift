//
//  ReviewsTableViewCell.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 21.02.2024.
//

import UIKit

#warning("TODO: Complete Stack")
class ReviewsTableViewCell: UITableViewCell {

    static let identifier = "ReviewsTableViewCell"
    
    let subtitle: UILabel = {
        let title = UILabel()
        title.text = "Reviews"
        return title
    }()
    
    let reviewStask: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    var reviewerName = UILabel()
    var photo = UIImageView()
    var reviewText = UILabel()
    
    let reviewCard: UIView = {
        let card = UIView()
        return card
    }()
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        addSubview(subtitle)
//    }
    
//    public func configureCell(who reviewer: String = "Anonymous", photoName: String = "avatar-default", text review: String) {
//        reviewerName.text = reviewer
//        photo.image = UIImage(named: photoName)
//        reviewText.text = review
//        configure()
//        setupConstraints()
//    }
    
    public func configureCell(numberOfReviews: Int) {
        configure()
        configureStack(numberOfReviews)
        setupConstraints()

    }
    
    private func configure() {
        addSubview(subtitle)
    }
    
    private func configureStack(_ reviews: Int) {
        clipsToBounds = true
        addSubview(reviewStask)
        
        for review in 0...reviews {
            reviewStask.addSubview(reviewCard)
            reviewCard.addSubview(photo)
            reviewCard.addSubview(reviewerName)
            reviewCard.addSubview(reviewText)

        }
        
//        reviewStask.addSubview(reviewCard)
//        reviewCard.addSubview(photo)
//        reviewCard.addSubview(reviewerName)
//        reviewCard.addSubview(review)
//        addSubview(subtitle)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension ReviewsTableViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: topAnchor),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            reviewStask.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 16),
            reviewStask.leadingAnchor.constraint(equalTo: subtitle.leadingAnchor),
            reviewStask.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
