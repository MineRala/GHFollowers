//
//  Follower.swift
//  GHFollowers
//
//  Created by Mine Rala on 16.10.2021.
//

import Foundation
// Hashable çünkü collectionViewa DiffableDataSource uygulandı.
struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
