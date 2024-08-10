//
//  Product.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 09.08.2024..
//

import Foundation
import UIKit
import Kingfisher

class Product {
    static let shared = Product()

    var productName: String
    var image: UIImage?
    var url: URL?

    private init() {
        self.productName = "Placeholder name"
        self.image = UIImage(named: "default_profile_icon")
        self.url = URL(string: "https://via.placeholder.com/150/000000/FFFFFF/?text=Profile")
    }
}
