//
//  SegmentShopApp.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI
import Segment
import SegmentFirebase

@main
struct SegmentShopApp: App {
    
    let cart : Cart = Cart()
    
    init() {
        Analytics.main.add(plugin: IDFACollection())
        Analytics.main.add(plugin: FirebaseDestination())
        
        let serverQueue = DispatchQueue(label: "com.example.SegmentShopServerQueue", qos: .utility)
        startServer()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(cart: cart)
        }
    }
}

extension Analytics {
    static var main = Analytics(configuration:
                                    Configuration(writeKey: "<write-key>")
        .flushAt(3)
        .trackApplicationLifecycleEvents(true))
}
