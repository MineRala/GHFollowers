//
//  User.swift
//  GHFollowers
//
//  Created by Mine Rala on 16.10.2021.
//

import Foundation

struct User: Codable {
    // optional olmayanları let yapabiliriz, optional olanlar var olsun.
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
}
