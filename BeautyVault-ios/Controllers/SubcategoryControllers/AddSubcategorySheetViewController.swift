//
//  AddSubcategorySheetViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 11.08.2024..
//

import UIKit

class AddSubcategorySheetViewController: UIViewController, UITextFieldDelegate {
    private lazy var submitButton = ActionButton(backgroundColor: UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 1), title: "Submit", action: submitHandler)

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Add Subcategory"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Please enter the name for the new subcategory."
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = .gray
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()

    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Subcategory Name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupTitleLabel()
        setupDescriptionLabel()
        setupTextField()
        setupSubmitButton()

        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
        ])
    }

    private func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupTextField() {
        view.addSubview(nameTextField)

        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupSubmitButton() {
        view.addSubview(submitButton)

        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            submitButton.widthAnchor.constraint(equalToConstant: 250),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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
