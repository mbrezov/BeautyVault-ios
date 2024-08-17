//
//  AddProductSheetViewController2.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 14.08.2024..
//

import UIKit

class AddProductSheetViewController2: UIViewController {
    private lazy var buyTitleLabel = InstructionLabel(text: "Would you purchase this product?")

    private lazy var buySelector: UISegmentedControl = {
        let buySelector = UISegmentedControl(items: ["Yes", "No"])
        buySelector.selectedSegmentIndex = 1
        buySelector.selectedSegmentTintColor = UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 1)
        buySelector.translatesAutoresizingMaskIntoConstraints = false
        buySelector.addTarget(self, action: #selector(buySelection(_:)), for: .valueChanged)
        return buySelector
    }()

    private lazy var priceLabel = InstructionLabel(text: "Please enter the cost of the product.")

    private lazy var priceField: UITextField = {
        let priceField = UITextField()
        priceField.placeholder = "EUR"
        priceField.borderStyle = .roundedRect
        priceField.translatesAutoresizingMaskIntoConstraints = false
        return priceField
    }()

    private lazy var productImageLabel = InstructionLabel(text: "Please upload a photo of the product.")

    private lazy var submitButton = BottomActionButton(backgroundColor: UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 1), title: "Submit", action: submitHandler)

    enum Constants {
        static let sectionSpacing: CGFloat = 20
        static let labelSpacing: CGFloat = 10
        static let padding: CGFloat = 20
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let closeButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(dismissAddProductSheet))
        closeButton.tintColor = .systemIndigo

        navigationItem.rightBarButtonItem = closeButton
        self.navigationController?.navigationBar.tintColor = .systemIndigo
        navigationItem.backButtonTitle = ""

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)

        configurePriceLabel()
        configurePriceField()
        configureBuyLabel()
        configureProductImageLabel()
        submitButton.configure(in: view)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc private func dismissAddProductSheet() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func submitHandler() {
        dismissKeyboard()
        dismissAddProductSheet()
    }

    @objc private func buySelection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Yes")
        case 1:
            print("No")
        default:
            print("No")
        }
    }

    private func configurePriceLabel() {
        view.addSubview(priceLabel)

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
        ])
    }

    private func configurePriceField() {
        view.addSubview(priceField)

        NSLayoutConstraint.activate([
            priceField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: Constants.labelSpacing),
            priceField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            priceField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            priceField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

    private func configureBuyLabel() {
        let buyContainer = UIView()
        buyContainer.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(buyContainer)

        buyContainer.addSubview(buyTitleLabel)
        buyContainer.addSubview(buySelector)

        NSLayoutConstraint.activate([
            buyTitleLabel.leadingAnchor.constraint(equalTo: buyContainer.leadingAnchor),
            buyTitleLabel.centerYAnchor.constraint(equalTo: buyContainer.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            buySelector.centerYAnchor.constraint(equalTo: buyContainer.centerYAnchor),
            buySelector.trailingAnchor.constraint(equalTo: buyContainer.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            buyContainer.topAnchor.constraint(equalTo: priceField.bottomAnchor, constant: Constants.sectionSpacing),
            buyContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            buyContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            buyContainer.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func configureProductImageLabel() {
        view.addSubview(productImageLabel)

        NSLayoutConstraint.activate([
            productImageLabel.topAnchor.constraint(equalTo: buySelector.bottomAnchor, constant: Constants.sectionSpacing),
            productImageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
        ])
    }
}
