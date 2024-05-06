//
//  CartItem.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import Foundation

struct CartItem: Identifiable, Codable {
    var id: String
    var product: Product
    var count: Int
    
    init(product: Product, count: Int) {
        self.id = UUID().uuidString
        self.product = product
        self.count = count
    }
}
