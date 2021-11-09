//
//  GFItemRepoVC.swift
//  GHFollowers
//
//  Created by Mine Rala on 6.11.2021.
//

import UIKit

// Sub Class
class GFRepoItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }

    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(background: .systemPurple, title: "GitHub Profile")
    }

    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
}

