//
//  CustomNavLink.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    @ObservedObject var cart: Cart
    let signalLabel: String?

    init(signalLabel: String? = nil, cart: Cart, destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
        self.cart = cart
        self.signalLabel = signalLabel
    }

    var body: some View {
        NavigationLink(
            destination: CustomNavigationContainerView(cart: cart) {
                destination
            }
            .navigationBarHidden(true)
            ,
            label: {
                label
            })
    }
}
