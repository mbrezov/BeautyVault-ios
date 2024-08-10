//
//  CategoriesCollectionViewCell.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    private lazy var newsTitleLabel: UILabel = {
        let newsTitleLabel = UILabel()
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.numberOfLines = 2
        newsTitleLabel.textColor = .systemIndigo
        newsTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        newsTitleLabel.adjustsFontForContentSizeCategory = true
        newsTitleLabel.layer.cornerRadius = 5
        newsTitleLabel.clipsToBounds = true
        return newsTitleLabel
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
        newsTitleLabel.text = category
    }

    private func configureTitleLabel() {
        contentView.addSubview(newsTitleLabel)

        NSLayoutConstraint.activate([
            newsTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            newsTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
