//
//  HTTP.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import Foundation

enum HTTP {
    enum Method: String {
        case post = "POST"
    }

    enum Headers {
        enum Key: String {
            case contentType = "Content-Type"
        }

        enum Value: String {
            case applicationJson = "application/json"
        }
    }
}
