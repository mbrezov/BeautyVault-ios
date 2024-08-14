//
//  MainTitleLabel.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 14.08.2024..
//

import UIKit

class MainTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(text: String) {
        super.init(frame: .zero)

        self.text = text
        configure()
    }

    private func configure() {
        font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
