//
//  MainView.swift
//  NeoTour-Programmatic
//
//  Created by Zhasmina Aitmagambetova on 19.02.2024.
//

import UIKit

protocol PlaceSelectionDelegate {
    func didPlaceChoice(at index: Int)
}

class MainView: UIView {
    
    private let collectionView: UICollectionView = {
       let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let sections = MockData.shared.pageData
    var selectionDelegate: PlaceSelectionDelegate?
    var tours: [TourResults.Tour]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configure()
        setConstraints()
        setDelegates()
    }
    
    func configure() {  
        addSubview(collectionView)
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        collectionView.register(PlaceCollectionViewCell.self, 
                                forCellWithReuseIdentifier: "PlaceCollectionViewCell")
        collectionView.register(RecommendedCollectionViewCell.self, 
                                forCellWithReuseIdentifier: "RecommendedCollectionViewCell")
        collectionView.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "HeaderSupplementaryView")
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @objc func placeDetails(sender: UIButton) {
        _ = IndexPath(row: sender.tag, section: 0)
        let placeViewController = PlaceViewController()
//        selectionDelegate?.didPlaceChoice(at: tag)
        self.window?.rootViewController?.show(placeViewController, sender: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Create Layout

extension MainView {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = sections[sectionIndex]
            
            switch section {
                
            case .category(_):
                return createCategorySection()
            case .places(_):
                return createPlaceSection()
            case .recommended(_):
                return createRecommendedSection()
            }
        }
    }
    
    // MARK: LayoutSection
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                                       heightDimension: .estimated(25)),
                                                                     elementKind: UICollectionView.elementKindSectionHeader,
                                                                     alignment: .top)
        
        return headerItem
    }

    // MARK: CategorySection
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .estimated(80),
                                                            heightDimension: .estimated(40)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.5),
                                                                         heightDimension: .estimated(50)),
                                                       subitems: [item])
        
        group.interItemSpacing = .flexible(1)
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 1,
                                          supplementaryItems: [])
        
        section.contentInsets = .init(top: 10, leading: 16, bottom: 10, trailing: 0)
        
        return section
    }
    
    // MARK: PlaceSection
    
    private func createPlaceSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), 
                                                            heightDimension: .fractionalHeight(1)))
        
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9),
                                                                         heightDimension: .estimated(255)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group, 
                                          behavior: .groupPaging,
                                          interGroupSpacing: 2,
                                          supplementaryItems: [])
        
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 0)
        
        return section
    }
    
    // MARK: RecommendedSection
    
    private func createRecommendedSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        // TODO: Make the scroll vertical
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                                                                       heightDimension: .fractionalHeight(1)),
                                                     subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 1,
                                          supplementaryItems: [supplementaryHeaderItem()])
        
        section.contentInsets = .init(top: 50, leading: 16, bottom: 0, trailing: 16)
        
        return section
    }
}

// MARK: - UICollectionViewDelegate

extension MainView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension MainView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
            // MARK: Category Section
        case .category(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(categoryName: category[indexPath.row].name)
            return cell
            
            // MARK: Places Section
        case .places(let place):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCollectionViewCell", for: indexPath) as? PlaceCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            let tour = self.tours[indexPath.row]
            cell.configureCell(imageName: tour.photoUrl, title: tour.name)
            
            #warning("TODO: Move to Controller")
            cell.image.tag = indexPath.row
            cell.image.addTarget(self, action: #selector(placeDetails), for: .touchUpInside)
            
            return cell
            
            // MARK: Recommended Section
        case .recommended(let recommended):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCollectionViewCell", for: indexPath) as? RecommendedCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: recommended[indexPath.row].image, title: recommended[indexPath.row].name)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader: 
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, 
                                                                         withReuseIdentifier: "HeaderSupplementaryView",
                                                                         for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(name: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
            
        }
    }
}

extension MainView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0)
        ])
    }
}
