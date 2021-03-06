//
//  PersistanceManager.swift
//  GHFollowers
//
//  Created by Mine Rala on 27.11.2021.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}


enum PersitenceManager {

    static private let defaults = UserDefaults.standard

    enum Keys {
        static let favorites = "favorites"
    }


    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites

                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }

                    retrievedFavorites.append(favorite)

                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }

                completed(save(favorites: retrievedFavorites))

            case .failure(let error):
                completed(error)
            }
        }
    }

    // Fovorites dataları getiriyor.
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }

        do {
            // Json formatından Follower formatına çeviriyor. Datayı serverden çekip objeye dönüştürüyor.
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }


    // favori data kayıt işlemini gerçekleştiriyor.
    static func save(favorites: [Follower]) -> GFError? {
        do {
            // json formatında Followerı kaydediyor. Yani follower jsonData oluyor.
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
