//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Mine Rala on 31.10.2021.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {

    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)

    var user: User!

    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElements()
    }

    private func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No bio available"
        bioLabel.numberOfLines = 3

        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
        

    }

    private func addSubviews() {
        self.view.addSubview(avatarImageView)
        self.view.addSubview(usernameLabel)
        self.view.addSubview(nameLabel)
        self.view.addSubview(locationImageView)
        self.view.addSubview(locationLabel)
        self.view.addSubview(bioLabel)
    }

    private func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12

        locationImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),

            usernameLabel.topAnchor.constraint(equalTo: self.avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),

            nameLabel.centerYAnchor.constraint(equalTo: self.avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 12),

            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),

            locationLabel.centerYAnchor.constraint(equalTo: self.locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: self.locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),

            bioLabel.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
