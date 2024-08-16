//
//  AddProductSheetViewController3.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 14.08.2024..
//

import UIKit

class AddProductSheetViewController3: UIViewController {
    private lazy var submitButton = BottomActionButton(backgroundColor: UIColor(red: 0.8, green: 0.82, blue: 0.89, alpha: 1.0), title: "Submit", action: submitHandler)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let closeButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(dismissAddProductSheet))
        closeButton.tintColor = .systemIndigo
        navigationItem.rightBarButtonItem = closeButton

        self.navigationController?.navigationBar.tintColor = .systemIndigo

        submitButton.configure(in: view)
    }

    @objc private func dismissAddProductSheet() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func submitHandler() {
        dismissAddProductSheet()
    }
}
