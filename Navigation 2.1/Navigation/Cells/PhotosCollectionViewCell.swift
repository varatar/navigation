//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Евгений Матафонов on 16.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: UIImage? {
        didSet {
            imageCollection.image = photo
        }
    }
    
    private let imageCollection: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.clipsToBounds = true
        image.toAutoLayout()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageCollection)
        
        let constraints = [
            imageCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
