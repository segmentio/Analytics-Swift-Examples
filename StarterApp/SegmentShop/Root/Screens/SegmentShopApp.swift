//
//  SegmentShopApp.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

@main
struct SegmentShopApp: App {
    
    let cart : Cart = Cart()

    init() {
        let serverQueue = DispatchQueue(label: "com.example.SegmentShopServerQueue", qos: .utility)
        startServer()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(cart: cart)
        }
    }
}
