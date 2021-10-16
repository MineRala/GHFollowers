//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Mine Rala on 16.10.2021.
//

import UIKit

class GFAvatarImageView: UIImageView {

    let placeholderImage = UIImage(named: "avatar-placeholder")!
    let cache = NetworkManager.shared.cache

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

    func downloadImage(from urlString: String) {
        let cacheKey = NSString(string: urlString)
        //cache kontrolü
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        //URL kontrol edildi.
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            // error kontrol edildi.
            if error != nil { return }
            //response kontrol edildi.
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            //data kontrol edildi.
            guard let data = data else { return }
            //image kontrol edildi.
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async { self.image = image }
        }
        task.resume()
    }
}
