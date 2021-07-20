//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Евгений Матафонов on 11.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private var baseInset: CGFloat { return 8 }
    private var sideInset: CGFloat { return 12 }
    
    private let photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        photosLabel.text = "Photos"
        photosLabel.textColor = .black
        photosLabel.toAutoLayout()
        return photosLabel
    }()
    
    //Какую именно стрелку не указали, поэтому выбрал ту, которую нашел в интернете
    private let arrowLabel: UILabel = {
        let arrowLabel = UILabel()
        arrowLabel.text = "\u{2192}"
        arrowLabel.toAutoLayout()
        arrowLabel.font = UIFont.systemFont(ofSize: 24, weight: .light)
        return arrowLabel
    }()
    
        private let photosStack: UIStackView = {
            let stackView = UIStackView()
            stackView.distribution = .fillEqually
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.alignment = .center
            stackView.toAutoLayout()
            return stackView
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        contentView.addSubViews(photosLabel, arrowLabel, photosStack )
        
        photosStack.addArrangedSubview(addPhoto(myImage: "assassins"))
        photosStack.addArrangedSubview(addPhoto(myImage: "cyberpunk"))
        photosStack.addArrangedSubview(addPhoto(myImage: "gow"))
        photosStack.addArrangedSubview(addPhoto(myImage: "itTakesTwo"))
        
        contentView.backgroundColor = .white
        
        let constraints = [
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: sideInset),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideInset),
        
            arrowLabel.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideInset),
            arrowLabel.widthAnchor.constraint(equalToConstant: 30),
            arrowLabel.heightAnchor.constraint(equalTo: arrowLabel.widthAnchor),
            
            photosStack.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: sideInset),
            photosStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideInset),
            photosStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideInset),
            photosStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -sideInset),
            photosStack.heightAnchor.constraint(equalToConstant: (contentView.frame.size.width - sideInset * 2 - baseInset * 3) / 4)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
//так как все мои картинки внутри стека идентичны, создам функцию, которая будет возвращать картинку
    func addPhoto(myImage: String) -> UIImageView {
        let photo = UIImageView()
        photo.image = UIImage(named: myImage)
        photo.layer.cornerRadius = 6.0
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill
        photo.toAutoLayout()
        return photo
    }
    
}
