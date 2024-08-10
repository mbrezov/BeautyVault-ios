//
//  RightBarButton.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 10.08.2024..
//

import UIKit

class RightBarButton: UIBarButtonItem {
    private var selectorHandler: (() -> Void)?

    init(image: UIImage?, action: (() -> Void)? = nil) {
        super.init()

        self.selectorHandler = action
        self.image = image
        self.target = self
        self.action = #selector(buttonTapped)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func buttonTapped() {
        selectorHandler?()
    }
}
