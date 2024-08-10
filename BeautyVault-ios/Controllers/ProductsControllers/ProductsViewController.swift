//
//  CategoryScreenViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import UIKit
import Kingfisher

class ProductsViewController: UIViewController {
//    private let placeholder: [String] = ["Skincare", "Hair", "Eyes", "Face", "Lips", "Body", "Makeup", "Perfume"]
    var placeholder: [Product] = [Product.shared, Product.shared, Product.shared, Product.shared]
    var subcategory: String

    private lazy var addProductButton: RightBarButton = {
        let image = UIImage(systemName: "plus.square.on.square")
        return RightBarButton(image: image) {
            self.addProduct()
        }
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = subcategory
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    private lazy var collectionView: UICollectionView = {
        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        layoutConfig.backgroundColor = .white
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0)
        return collectionView
    }()

    private let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Product> { cell, indexPath, item in
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = item.productName
        contentConfiguration.textProperties.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        contentConfiguration.textProperties.color = .systemIndigo
        
        cell.backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        cell.backgroundConfiguration?.backgroundColor = UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 0.5)

        cell.contentConfiguration = contentConfiguration
    }
    
    init(subcategory: String) {
        self.subcategory = subcategory

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = addProductButton

        collectionView.dataSource = self
        collectionView.delegate = self

        configureTableView()
    }

    @objc private func addProduct() {
        print("Im tapped")
    }

    private func configureTableView() {
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}

extension ProductsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeholder.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: placeholder[indexPath.item])
        return cell
    }
}

extension ProductsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = placeholder[indexPath.row]
        let productViewController = ProductViewController(product: selectedProduct)
        
        navigationController?.pushViewController(productViewController, animated: true)
    }
}
