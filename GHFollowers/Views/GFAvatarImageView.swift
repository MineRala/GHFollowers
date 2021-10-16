//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Mine Rala on 16.10.2021.
//

import UIKit

class GFAvatarImageView: UIImageView {

    let placeholderImage = UIImage(named: "avatar-placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = 16
        clipsToBounds = true  // kenarlarını yuvarlayabilmek için true yapmamız gerekiyot.
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
