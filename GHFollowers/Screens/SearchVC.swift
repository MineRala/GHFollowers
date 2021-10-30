//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Mine Rala on 14.10.2021.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    private func configureViewController() {
        self.view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureUserNameTextField()
        configureCallToActionButton()
        createDissmisKeyboardTapGesture()
    }

    private func configureLogoImageView() {
        self.view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!

        //Totalde active demek oluyor.Tek tek constraintler .iaActive = true yazmaya gerek yok.
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    private func configureUserNameTextField() {
        self.view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        usernameTextField.autocapitalizationType = .none
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func configureCallToActionButton() {
        self.view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func pushFollowerListVC() {
        guard  isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 🙂.", buttonTitle: "OK" )
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }

    private func createDissmisKeyboardTapGesture() {
        //view.endEditing yaptık çünkü viewın herhangibir yerine dokunduğunda klavye kapansın istedik.
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tap)
    }
}

//MARK: - UITextField Delegate
extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}


