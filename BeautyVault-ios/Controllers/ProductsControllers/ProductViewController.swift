//
//  ProductViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import UIKit

class ProductViewController: UIViewController {
    var product: Product

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

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = product.productName
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
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
    
    @objc func editProduct() {
        print("Im working")
    }

    private func configureCollectionView() {
        accountProfileImg.kf.setImage(with: product.url, placeholder: product.image)
        view.addSubview(accountProfileImg)
        NSLayoutConstraint.activate([
            accountProfileImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            accountProfileImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])

        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: accountProfileImg.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])

    }
}
