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
            descriptionLabel.font = .systemFont(ofSize: 12)
            descriptionLabel.textAlignment = .left
            descriptionLabel.text = descrip ?? "-"
            //            artistNameLabel.textAlignment = .right
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
   
    
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        backgroundColor = UIColor(named: "Background")
        
        
        
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -10),
            //imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            imageView.heightAnchor.constraint(equalToConstant: .screenWidth / 3),
            imageView.widthAnchor.constraint(equalToConstant: .screenWidth / 3)
        ])
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
