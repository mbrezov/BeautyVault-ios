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
    private lazy var accountLabel: UILabel = {
        let accountLabel = UILabel()
        accountLabel.text = "Account"
        accountLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        return accountLabel
    }()
    
    private lazy var accountProfileImg: UIImageView = {
        let accountProfileImg = UIImageView(frame: .zero)
        accountProfileImg.layer.masksToBounds = false
        accountProfileImg.clipsToBounds = true
        accountProfileImg.translatesAutoresizingMaskIntoConstraints = false
        return accountProfileImg
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
    
    private lazy var logoutButton = ActionButton(backgroundColor: .systemIndigo, title: "Logout", action: logoutHandler)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let image = UIImage(named: "default_profile_icon")
        let url = URL(string: "https://via.placeholder.com/150/000000/FFFFFF/?text=Profile")
        accountProfileImg.kf.setImage(with: url, placeholder: image)

        configureAccountDetails()
        configureButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        accountProfileImg.layer.cornerRadius = accountProfileImg.frame.height / 2
    }
    
    func configureAccountDetails() {
        view.addSubview(accountLabel)
        NSLayoutConstraint.activate([
            accountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            accountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(accountProfileImg)
        NSLayoutConstraint.activate([
            accountProfileImg.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 20),
            accountProfileImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
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
            emailContainer.topAnchor.constraint(equalTo: accountProfileImg.bottomAnchor, constant: 30),
            emailContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureButton() {
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            logoutButton.widthAnchor.constraint(equalToConstant: 250),
            logoutButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc func logoutHandler() {
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
