//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Mine Rala on 30.10.2021.
//

import UIKit

class UserInfoVC: UIViewController {

    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        print(username!)

    }

    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}
