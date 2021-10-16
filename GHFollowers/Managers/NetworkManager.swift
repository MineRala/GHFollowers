//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Mine Rala on 16.10.2021.
//

import UIKit

class NetworkManager {
    //Use Singelton Pattern
    // static shared çünkü heryerden sharede ulaşmak istedim.
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()

    private init() {}
    
    //Generic oluşturduk. Ya Follower arrayi dönecek yada GFError dönecek. GFError custom errror.
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        // Url kontrol edildi.
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // error kontrol edildi.
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            // response kontrol edildi.
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            // data kontrol edildi.
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                // Decode yaptık çünkü datayı serverdan çekip objeye dönüştürdük.
                let decoder = JSONDecoder()
                // snakeCase yaptık tekrar structtaki attribute isimlerini değiştirmeme gerek kalmadı.
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        // Network call başlıyor.
        task.resume()
    }
}
