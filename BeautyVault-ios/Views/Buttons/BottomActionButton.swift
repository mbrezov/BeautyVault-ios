//
//  BottomActionButton.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 16.08.2024..
//

import UIKit

class BottomActionButton: UIButton {
    private var selectorHandler: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(backgroundColor: UIColor, title: String, action: (() -> Void)? = nil) {
        super.init(frame: .zero)

        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.selectorHandler = action
        configure()

        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }

    @objc private func buttonTapped() {
        selectorHandler?()
    }

    func configure(in view: UIView) {
        view.addSubview(self)

        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -20),
            self.widthAnchor.constraint(equalToConstant: 250),
            self.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
