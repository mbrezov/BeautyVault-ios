//
//  ServerResponses.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import Foundation

class SucessResponse: Decodable {
    let email: String
    let token: String
}

class ErrorResponse: Decodable {
    let error: String
}
