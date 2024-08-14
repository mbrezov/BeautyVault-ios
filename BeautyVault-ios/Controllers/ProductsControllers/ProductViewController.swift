//
//  ProductViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import UIKit

class ProductViewController: UIViewController {
    let product: Product

    private lazy var titleLabel = MainTitleLabel(text: product.productName)

    private lazy var editProductButton: RightBarButton = {
        let image = UIImage(systemName: "slider.horizontal.2.square.on.square")
        return RightBarButton(image: image) {
            self.editProduct()
        }
    }()

    private lazy var accountProfileImg: UIImageView = {
        let accountProfileImg = UIImageView(frame: .zero)
        accountProfileImg.translatesAutoresizingMaskIntoConstraints = false
        accountProfileImg.contentMode = .scaleAspectFit
        return accountProfileImg
    }()

    init(product: Product) {
        self.product = product

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        navigationItem.rightBarButtonItem = editProductButton

        configureCollectionView()
    }

    @objc private func editProduct() {
        print("Im working")
    }

    private func configureCollectionView() {
        view.addSubview(accountProfileImg)
        view.addSubview(titleLabel)

        accountProfileImg.kf.setImage(with: product.url, placeholder: product.image)

        NSLayoutConstraint.activate([
            accountProfileImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            accountProfileImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: accountProfileImg.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])

    }
}
