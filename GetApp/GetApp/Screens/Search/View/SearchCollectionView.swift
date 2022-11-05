//
//  SearchView.swift
//  GetApp
//
//  Created by Eymen Varilci on 5.11.2022.
//

import UIKit

final class SearchView: UIView {
    // MARK: - Properties
    private let cellInset: CGFloat = 2.0
    private let cellMultiplier: CGFloat = 0.3
    private var cellDimension: CGFloat {
        .screenWidth * cellMultiplier - cellInset
    }
    
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellDimension,
                                     height: cellDimension)
        return flowLayout
    }()
    
     lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "Searchcell")
        setupCollectionViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints method
    private func setupCollectionViewLayout() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    // MARK: - Set delegate method
    func setCollectionViewDelegate(_ delegate: UICollectionViewDelegate,
                                   andDataSource dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
}
