//
//  DetailView.swift
//  GetApp
//
//  Created by Eymen Varilci on 4.11.2022.
//

import UIKit


final class DetailView: UIView {
    
    weak var delegate: DetailDelegate?
    
    var title: String? {
        didSet {
           
            titleLabel.text = title ?? "-"
           
        }
    }
    
    var descrip: String? {
        didSet {
           
            descriptionLabel.text = descrip ?? "-"
            //            artistNameLabel.textAlignment = .right
        }
    }
    
    var cost: Double? {
        didSet {
            
            costLabel.text = "\(cost)" ?? "-"
            
        }
    }
    
    
    
    private(set) var imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let costLabel = UILabel()
   
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "Background")
        
        titleLabel.numberOfLines = .zero
        descriptionLabel.numberOfLines = .zero
        costLabel.numberOfLines = .zero
        
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            imageView.heightAnchor.constraint(equalToConstant: .screenWidth)
        ])
        imageView.layer.cornerRadius = 39
        imageView.clipsToBounds = true
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        addSubview(costLabel)
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            costLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32.0),
            costLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -24.0),
            costLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
