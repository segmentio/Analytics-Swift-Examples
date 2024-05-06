//
//  CustomNavView.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    
    let content: Content
    let cart : Cart
    
    init(cart: Cart, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.cart  = cart
    }
    
    var body: some View {
        NavigationView {
            CustomNavigationContainerView(cart: cart) {
                content
                
            }
            .navigationBarHidden(true)
            .shadow(radius: 10)

        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

