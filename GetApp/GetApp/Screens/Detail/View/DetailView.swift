//
//  DetailView.swift
//  GetApp
//
//  Created by Eymen Varilci on 4.11.2022.
//

import UIKit


final class DetailView: UIView {
    
     var delegate: DetailDelegate?
    // MARK: - PROPERTIES
    
    var category: String? {
        didSet {
            categoryLabel.textAlignment = .center
            categoryLabel.textColor = UIColor(named: "AccentColor")?.withAlphaComponent(0.7)
            categoryLabel.font = .systemFont(ofSize: 20)
            categoryLabel.text = category ?? "-"
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.numberOfLines = .zero
            titleLabel.textAlignment = .center
            titleLabel.textColor = UIColor(named: "AccentColor")
            titleLabel.font = .boldSystemFont(ofSize: 20)
            titleLabel.text = title ?? "-"
           
        }
    }
    
    var descrip: String? {
        didSet {
            descriptionLabel.numberOfLines = .zero
            descriptionLabel.font = .systemFont(ofSize: 17)
            descriptionLabel.textAlignment = .left
            descriptionLabel.text = descrip ?? "-"
        }
    }
    
    var cost: Double? {
        didSet {
            
            costLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
            costLabel.textColor = UIColor(named: "Cost")
            costLabel.text = "\(cost ?? 0)$"
            
        }
    }
    
    // MARK: - UI COMPONENTS
    private(set) var imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let costLabel = UILabel()
    private let categoryLabel = UILabel()
    
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        backgroundColor = UIColor(named: "Background")
        
        
        
        // MARK: - DETAIL VIEWS LAYOUT
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10),
            
            imageView.heightAnchor.constraint(equalToConstant: .screenWidth / 3),
            imageView.widthAnchor.constraint(equalToConstant: .screenWidth / 3)
        ])
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleLabel.widthAnchor.constraint(equalToConstant: .screenWidth),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            descriptionLabel.widthAnchor.constraint(equalToConstant:  .screenWidth),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        addSubview(costLabel)
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            costLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 32.0),
            costLabel.heightAnchor.constraint(equalToConstant: 75),
            costLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 0)
        ])
        
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            categoryLabel.heightAnchor.constraint(equalToConstant: 25),
            categoryLabel.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 8)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
