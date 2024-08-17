//
//  AddProductSheetViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 14.08.2024..
//

import UIKit

class AddProductSheetViewController1: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    private lazy var nextButton = BottomActionButton(backgroundColor: UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 1), title: "Next", action: nextHandler)

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
        static let sectionSpacing: CGFloat = 20
        static let labelSpacing: CGFloat = 10
        static let padding: CGFloat = 20
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

        descriptionTextView.delegate = self
        nameTextField.delegate = self

        nameTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }

    private func configureTitleLabel() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
        ])
    }

    private func configureNameLabel() {
        view.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.sectionSpacing),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
        ])
    }

    private func configureTextField() {
        view.addSubview(nameTextField)

        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.labelSpacing),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func configureDescriptionLabel(){
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: Constants.sectionSpacing),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
        ])
    }

    private func configureDescriptionTextField(){
        view.addSubview(descriptionTextView)

        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.labelSpacing),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc private func nextHandler() {
        guard let title = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !title.isEmpty else {
            return
        }
        guard let description = descriptionTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines), !description.isEmpty else {
            return
        }

        dismissKeyboard()

        let vc = AddProductSheetViewController2()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func textFieldsDidChange() {
        let isTitleEmpty = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
        let isDescriptionEmpty = descriptionTextView.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true

        if isTitleEmpty || isDescriptionEmpty {
            nextButton.backgroundColor = UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 1)
        } else {
            nextButton.backgroundColor = .systemIndigo
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        textFieldsDidChange()
    }
}
