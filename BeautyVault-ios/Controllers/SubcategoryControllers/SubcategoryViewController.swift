//
//  CategoryScreenViewController.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import UIKit

class SubcategoryViewController: UIViewController {
    private let placeholder: [String] = ["Testsubcategory1Testsubcategory1Testsubcategory1", "Testsubcategory2", "Testsubcategory3", "Testsubcategory1", "Testsubcategory1", "Testsubcategory1", "Testsubcategory1", "Testsubcategory1Testsubcategory1Testsubcategory1Testsubcategory1"]

    private lazy var addSubcategoryButton: RightBarButton = {
        let image = UIImage(systemName: "plus.square.on.square")
        return RightBarButton(image: image) {
            self.addSubcategory()
        }
    }()

    private lazy var collectionView: UICollectionView = {
        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        layoutConfig.backgroundColor = .white
        layoutConfig.trailingSwipeActionsConfigurationProvider = { indexPath in
            let deleteAction = UIContextualAction(style: .normal, title: "Delete") { [weak self] (action, view, completionHandler) in
                 self?.handleDeleteAction(at: indexPath)
                 completionHandler(true)
             }
            deleteAction.backgroundColor = .clear

             let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, completionHandler) in
                 self?.handleEditAction(at: indexPath)
                 completionHandler(true)
             }

             let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
             configuration.performsFirstActionWithFullSwipe = false
             return configuration
        }
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private func handleDeleteAction(at indexPath: IndexPath) {
        let alertController = UIAlertController(
            title: "Confirmation",
            message: "This action will permanently delete the selected subcategory. All products within this subcategory will also be removed.",
            preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Confrim", style: .default) { _ in
            print("Delete item at \(indexPath)")
        }

        let noAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("Delete item at \(indexPath)")
        }

        alertController.addAction(yesAction)
        alertController.addAction(noAction)

        present(alertController, animated: true, completion: nil)
    }

    private func handleEditAction(at indexPath: IndexPath) {
        let alertController = UIAlertController(
            title: "Edit Subcategory Name",
            message: "Please enter a new name for this subcategory.",
            preferredStyle: .alert
        )

        alertController.addTextField { textField in
            textField.placeholder = "Name"
        }

        let submitAction = UIAlertAction(title: "Submit", style: .default) { _ in
            if let text = alertController.textFields?.first?.text, !text.isEmpty {
                print(text)
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)

        alertController.addAction(submitAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    private let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { cell, indexPath, item in
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = item
        contentConfiguration.textProperties.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        contentConfiguration.textProperties.color = .systemIndigo
        cell.backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        cell.backgroundConfiguration?.backgroundColor = UIColor(red: 0.85, green: 0.87, blue: 1, alpha: 0.5)
        cell.contentConfiguration = contentConfiguration
    }

    var category: String

    init(category: String) {
        self.category = category

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        navigationItem.rightBarButtonItem = addSubcategoryButton
        navigationItem.backButtonTitle = ""

        title = category
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        configureTableView()
    }

    @objc private func addSubcategory() {
        print("Im tapped")
    }

    private func configureTableView() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension SubcategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeholder.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: placeholder[indexPath.item])
        return cell
    }
}

extension SubcategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSubcategory = placeholder[indexPath.row]
        let productsViewController = ProductsViewController(subcategory: selectedSubcategory)

        navigationController?.pushViewController(productsViewController, animated: true)
    }
}
