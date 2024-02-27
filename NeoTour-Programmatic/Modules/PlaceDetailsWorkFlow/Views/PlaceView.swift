//
//  PlaceView.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 20.02.2024.
//

import UIKit

class PlaceView: UIView {
    
    var title = UILabel()
    var backgroundImage = UIImageView()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        table.register(ReviewsTableViewCell.self, forCellReuseIdentifier: ReviewsTableViewCell.identifier)
        table.contentInsetAdjustmentBehavior = .never
        return table
    }()
    
    let button: CustomPrimaryButton = {
        let button = CustomPrimaryButton()
        button.setTitle("Book Now", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configure()
        setupConstraints()
    }
    
    private func configure() {
        addSubview(tableView)
        addSubview(button)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
//    func bookButtonPressed() {
//        let bottomSheetViewController = BottomSheetViewController()
//        if let sheet = bottomSheetViewController.sheetPresentationController {
//            sheet.detents = [.medium()]
//            sheet.prefersGrabberVisible = true
//            sheet.preferredCornerRadius = 28
//        }
//        
//        present(bottomSheetViewController, animated: true)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITableViewDelegate

extension PlaceView: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension PlaceView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as! DescriptionTableViewCell
    #warning ("TODO: Connect API")
            cell.configureCell(name: "Mount Fuji", location: "Honshu, Japan", imageName: "mount-fuji", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.")
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewsTableViewCell.identifier, for: indexPath) as! ReviewsTableViewCell
    #warning ("TODO: Connect API")
        cell.configureCell(numberOfReviews: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        if indexPath.row < 1 {
            return screenHeight - screenHeight / 3.5
        }
        return screenHeight / 2
    }
}

extension PlaceView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
