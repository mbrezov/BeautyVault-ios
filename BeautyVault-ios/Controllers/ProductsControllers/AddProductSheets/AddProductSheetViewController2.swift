//
//  AddProductSheetViewController2.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 14.08.2024..
//

import UIKit

class AddProductSheetViewController2: UIViewController {
    private lazy var nextButton = ActionButton(backgroundColor: UIColor(red: 0.8, green: 0.82, blue: 0.89, alpha: 1.0), title: "Next", action: nextHandler)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let closeButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(dismissAddProductSheet))
        closeButton.tintColor = .systemIndigo

        navigationItem.rightBarButtonItem = closeButton
        self.navigationController?.navigationBar.tintColor = .systemIndigo
        navigationItem.backButtonTitle = ""

        configureNextButton()
    }

    @objc private func dismissAddProductSheet() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func nextHandler() {
        let vc = AddProductSheetViewController3()

        navigationController?.pushViewController(vc, animated: true)
    }

    private func configureNextButton() {
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalToConstant: 250),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
