//
//  SettingsViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import Foundation
import UIKit
import Kingfisher


class SettingsViewController: UIViewController {
    private lazy var titleLabel = MainTitleLabel(text: "Account")

    private lazy var accountProfileImage: UIImageView = {
        let accountProfileImage = UIImageView(frame: .zero)
        accountProfileImage.layer.masksToBounds = false
        accountProfileImage.clipsToBounds = true
        accountProfileImage.translatesAutoresizingMaskIntoConstraints = false
        return accountProfileImage
    }()

    private lazy var emailIcon: UIImageView = {
        let emailIcon = UIImageView()
        emailIcon.image = UIImage(systemName: "envelope")
        emailIcon.tintColor = .black
        emailIcon.translatesAutoresizingMaskIntoConstraints = false
        return emailIcon
    }()

    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        let userEmail = UserDefaults.standard.string(forKey: "UserEmail")
        emailLabel.text = userEmail
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()

    private lazy var logoutButton = BottomActionButton(backgroundColor: .systemIndigo, title: "Logout", action: logoutHandler)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let image = UIImage(named: "default_profile_icon")
        let url = URL(string: "https://via.placeholder.com/150/000000/FFFFFF/?text=Profile")
        accountProfileImage.kf.setImage(with: url, placeholder: image)

        configureTitleLabel()
        configureAccountProfileImage()
        configureEmailLabel()
        logoutButton.configure(in: view)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        accountProfileImage.layer.cornerRadius = accountProfileImage.frame.height / 2
    }

    private func configureTitleLabel() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func configureAccountProfileImage() {
        view.addSubview(accountProfileImage)

        NSLayoutConstraint.activate([
            accountProfileImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            accountProfileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func configureEmailLabel() {
        let emailContainer = UIView()
        emailContainer.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(emailContainer)
        
        emailContainer.addSubview(emailIcon)
        emailContainer.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            emailIcon.leadingAnchor.constraint(equalTo: emailContainer.leadingAnchor),
            emailIcon.centerYAnchor.constraint(equalTo: emailContainer.centerYAnchor),
            emailIcon.widthAnchor.constraint(equalToConstant: 24),
            emailIcon.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: emailIcon.trailingAnchor, constant: 10),
            emailLabel.trailingAnchor.constraint(equalTo: emailContainer.trailingAnchor),
            emailLabel.centerYAnchor.constraint(equalTo: emailIcon.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            emailContainer.topAnchor.constraint(equalTo: accountProfileImage.bottomAnchor, constant: 30),
            emailContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func logoutHandler() {
        UserDefaults.standard.removeObject(forKey: "AuthToken")
        UserDefaults.standard.synchronize()

        let vc = OnboardViewController()

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController = UINavigationController(rootViewController: vc)
                window.makeKeyAndVisible()
            }
        }
    }
}
