//
//  CategoriesCollectionViewCell.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    private lazy var categoryTitleLabel: UILabel = {
        let categoryTitleLabel = UILabel()
        categoryTitleLabel.textColor = .systemIndigo
        categoryTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        categoryTitleLabel.adjustsFontForContentSizeCategory = true
        categoryTitleLabel.layer.cornerRadius = 5
        categoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return categoryTitleLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 0.5)
        self.layer.cornerRadius = 10

        configureTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(category: String) {
        categoryTitleLabel.text = category
    }

    private func configureTitleLabel() {
        contentView.addSubview(categoryTitleLabel)

        NSLayoutConstraint.activate([
            categoryTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
