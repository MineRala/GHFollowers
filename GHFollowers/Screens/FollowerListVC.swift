//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Mine Rala on 15.10.2021.
//

import UIKit

class FollowerListVC: UIViewController {
    // username = SearchVC() -> textField.text
    var username: String!
    var collectionView: UICollectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        getFollowers()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func configureViewController() {
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        configureCollectionView()
    }

    private func configureCollectionView() {
        //frame = view.bounds -> tüm view kadar colloectionViewın frame'i
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }

    private func getFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
}
