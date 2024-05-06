//
//  CollectionResponse.swift
//  SegmentShop
//
//  Created by Alan Charles on 3/11/24.
//

import Foundation

struct CollectionResponse: Decodable {
    let data: CollectionResponseData
}

struct CollectionResponseData: Decodable {
    let title: String
}
