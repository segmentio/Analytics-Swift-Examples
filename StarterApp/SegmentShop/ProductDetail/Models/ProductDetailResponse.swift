//
//  ProductDetailResponse.swift
//  SegmentShop
//
//  Created by Alan Charles on 3/12/24.
//

import Foundation

struct ProductDetailResponse: Decodable {
    let data: ProductDetailResponseData
}

struct ProductDetailResponseData: Decodable {
    let title: String
}
