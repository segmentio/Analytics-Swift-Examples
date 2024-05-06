//
//  APIError.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import Foundation

enum APIError: String, Error {
    case jsonDecoding
    case response
    case noInternet
}
