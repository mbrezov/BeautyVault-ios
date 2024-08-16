//
//  AddProductSheetViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 14.08.2024..
//

import UIKit

class AddProductSheetViewController1: UIViewController, UITextFieldDelegate {
    private lazy var nextButton = BottomActionButton(backgroundColor: UIColor(red: 0.8, green: 0.82, blue: 0.89, alpha: 1.0), title: "Next", action: nextHandler)

    private lazy var titleLabel = SecondaryTitleLabel(text: "Add Product")

    private lazy var nameLabel = InstructionLabel(text: "Please enter the product name.")

    private lazy var descriptionLabel = InstructionLabel(text: "Please enter product description.")

    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Product name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()

    private lazy var descriptionTextView: UITextView = {
        let nameTextField = UITextView()
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.cornerRadius = 5.0
        nameTextField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        nameTextField.font = UIFont.systemFont(ofSize: 14)
        nameTextField.sizeToFit()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()
    
    enum Constants {
        static let topPadding = CGFloat(10)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.backButtonTitle = ""

        configureTitleLabel()
        configureNameLabel()
        configureTextField()
        configureDescriptionLabel()
        configureDescriptionTextField()
        nextButton.configure(in: view)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)

        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    private func configureTitleLabel() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
        ])
    }

    private func configureNameLabel() {
        view.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func configureTextField() {
        view.addSubview(nameTextField)

        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.topPadding),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureDescriptionLabel(){
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func configureDescriptionTextField(){
        view.addSubview(descriptionTextView)

        NSLayoutConstraint.activate([
            descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.topPadding),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc private func nextHandler() {
        dismissKeyboard()

        let vc = AddProductSheetViewController2()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func textFieldDidChange() {
        let isTextFieldEmpty = nameTextField.text?.isEmpty ?? true

        nextButton.backgroundColor = isTextFieldEmpty ? UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 1) : .systemIndigo
        nextButton.isEnabled = !isTextFieldEmpty
    }
}
