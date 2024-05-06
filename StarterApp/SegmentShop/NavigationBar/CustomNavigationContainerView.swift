//
//  CustomNavigationContainerView.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct CustomNavigationContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    @ObservedObject var cart: Cart


    init(cart: Cart, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.cart = cart
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationView(showBackButton: showBackButton, title: title, subtitle: subtitle, cart: cart)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self,
        perform: { value in
            self.title = value
        })
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self,
        perform: { value in
            self.subtitle = value
        })
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self,
        perform: { value in
            self.showBackButton = !value
        })
    }
}


