//
//  AddSubcategorySheetViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 11.08.2024..
//

import UIKit

class AddSubcategorySheetViewController: UIViewController, UITextFieldDelegate {
    private lazy var titleLabel = SecondaryTitleLabel(text: "Add Subcategory")

    private lazy var descriptionLabel = InstructionLabel(text: "Please enter the name for the new subcategory.")

    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Subcategory Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()

    private lazy var submitButton = BottomActionButton(backgroundColor: UIColor(red: 0.8, green: 0.82, blue: 0.89, alpha: 1.0), title: "Submit", action: submitHandler)

    enum Constants {
        static let topPadding = CGFloat(10)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureTitleLabel()
        configureDescriptionLabel()
        configureTextField()
        submitButton.configure(in: view)

        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    private func configureTitleLabel() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
        ])
    }

    private func configureDescriptionLabel() {
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func configureTextField() {
        view.addSubview(nameTextField)

        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.topPadding),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc private func submitHandler() {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        print(name)
        dismiss(animated: true, completion: nil)
    }

    @objc private func textFieldDidChange() {
        let isTextFieldEmpty = nameTextField.text?.isEmpty ?? true
        submitButton.backgroundColor = isTextFieldEmpty ? UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 1) : .systemIndigo
        submitButton.isEnabled = !isTextFieldEmpty
    }
}
