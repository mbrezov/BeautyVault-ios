//
//  ProductViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import UIKit

class ProductViewController: UIViewController {
    let product: Product
    let pricePlaceholder: Double = 33.99
    let descriptionPlaceholder: String = "Both rest of know draw fond post as. It agreement defective to excellent. Feebly do engage of narrow. Extensive repulsive belonging depending if promotion be zealously as. Preference inquietude ask now are dispatched led appearance. Small meant in so doubt hopes. Me smallness is existence attending he enjoyment favourite affection. Delivered is to ye belonging enjoyment preferred. Astonished and acceptance men two discretion. Law education recommend did objection how old."

    enum Constants {
        static let imageHeight: CGFloat = 350
        static let imageWidth: CGFloat = 350
        static let padding: CGFloat = 16
        static let labelSpacing: CGFloat = 5
        static let sectionSpacing: CGFloat = 15
    }

    private lazy var titleLabel = MainTitleLabel(text: product.productName)
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = descriptionPlaceholder + descriptionPlaceholder
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()

    private lazy var priceLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = String(pricePlaceholder) + "$"
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .bold)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()

    private lazy var buyTitleLabel: UILabel = {
        let buyTitleLabel = UILabel()
        buyTitleLabel.text = "Buy again:"
        buyTitleLabel.font = .systemFont(ofSize: 14)
        buyTitleLabel.textColor = .gray
        buyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return buyTitleLabel
    }()

    private lazy var buyLabel: UILabel = {
        let buyLabel = UILabel()
        buyLabel.text = "Yes"
        buyLabel.font = .systemFont(ofSize: 14, weight: .bold)
        buyLabel.textColor = .systemIndigo
        buyLabel.translatesAutoresizingMaskIntoConstraints = false
        return buyLabel
    }()

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
        accountProfileImg.layer.masksToBounds = true
        accountProfileImg.layer.cornerRadius = 10
        accountProfileImg.kf.setImage(with: product.url, placeholder: product.image)
        return accountProfileImg
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
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

        configureScrollView()
        configureContentView()
    }

    @objc private func editProduct() {
        print("Im working")
    }

    private func configureScrollView() {
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)

            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
        }

    private func configureContentView() {
        contentView.addSubview(accountProfileImg)
        contentView.addSubview(priceLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)

        configureBuyLabel()

        NSLayoutConstraint.activate([
            accountProfileImg.topAnchor.constraint(equalTo: contentView.topAnchor),
            accountProfileImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            accountProfileImg.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            accountProfileImg.widthAnchor.constraint(equalToConstant: Constants.imageWidth)
        ])

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: accountProfileImg.bottomAnchor, constant: Constants.sectionSpacing),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: Constants.labelSpacing),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding)
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: buyLabel.bottomAnchor, constant: Constants.labelSpacing * 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.padding),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func configureBuyLabel() {
        let buyContainer = UIView()
        buyContainer.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(buyContainer)
        
        buyContainer.addSubview(buyTitleLabel)
        buyContainer.addSubview(buyLabel)
        
        NSLayoutConstraint.activate([
            buyTitleLabel.leadingAnchor.constraint(equalTo: buyContainer.leadingAnchor),
            buyTitleLabel.centerYAnchor.constraint(equalTo: buyContainer.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            buyLabel.centerYAnchor.constraint(equalTo: buyTitleLabel.centerYAnchor),
            buyLabel.leadingAnchor.constraint(equalTo: buyTitleLabel.trailingAnchor, constant: Constants.labelSpacing)
        ])


        NSLayoutConstraint.activate([
            buyContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.sectionSpacing),
            buyContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.padding)
        ])
    }
}
