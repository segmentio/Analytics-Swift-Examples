//
//  ContentView.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cart: Cart
    
    var body: some View {
        RootScreen(cart: cart)
            .environmentObject(Auth.shared)
    }
}
