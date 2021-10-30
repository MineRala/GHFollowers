//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Mine Rala on 15.10.2021.
//

import UIKit
// bu viewcontroller extensionunu kullanan herkes containerViewa ulaşabilir.O yüzden fileprivate yaptık.
fileprivate var containerView: UIView!

extension UIViewController {

    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }

    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        // alpha görünmezlik. alpha = tranparency
        containerView.alpha = 0

        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }

        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        activityIndicator.startAnimating()
    }

    func dismissLoadingView() {
        //UI ile ilgili olduğu için main treadde yapılması lazım.
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }

    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
