//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Mine Rala on 16.10.2021.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    // reuseID' ye heryerden erişebilmek için static yaptım.
    static let reuseID = "FollowerCell"
    let padding: CGFloat = 8

    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),

            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    func set(follower: Follower) {
        usernameLabel.text = follower.login
    }
}
