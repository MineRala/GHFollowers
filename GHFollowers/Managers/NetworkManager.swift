//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Mine Rala on 16.10.2021.
//

import Foundation

class NetworkManager {
    //Use Singelton Pattern
    let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"

    private init() {}

    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        guard  let url = URL(string: endpoint) else {
            completed(nil,"This username created an invalid request.Please try again..")
            return
        }

       // let task = URLSession.shared
    }
}
