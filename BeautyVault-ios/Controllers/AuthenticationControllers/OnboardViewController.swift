//
//  HomeViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import UIKit

class OnboardViewController: UIViewController {
    private lazy var signupButton = ActionButton(backgroundColor: .systemIndigo, title: "Sign Up", action: signupHandler)
    private lazy var loginButton = ActionButton(backgroundColor: .systemIndigo, title: "Login", action: loginHandler)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
   
        configureButtons()
    }
    
    private func configureButtons() {
        view.addSubview(signupButton)
        view.addSubview(loginButton)

        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loginButton.widthAnchor.constraint(equalToConstant: 250),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -30),
            signupButton.widthAnchor.constraint(equalToConstant: 250),
            signupButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func signupHandler() {
        let vc = SignupViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func loginHandler() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
