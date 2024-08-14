//
//  WishlistViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 10.08.2024..
//

import UIKit

class WishlistViewController: UIViewController {
    private lazy var titleLabel = MainTitleLabel(text: "Wishlist")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureCollectionView()
    }

    private func configureCollectionView() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
}
