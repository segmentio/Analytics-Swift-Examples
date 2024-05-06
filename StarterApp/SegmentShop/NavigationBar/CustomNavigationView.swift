//
//  CustomNavigationView.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    @ObservedObject var cart: Cart
    
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            
            Spacer()
            titleSection
                .padding(.leading, 15)
            Spacer()
            cartButton
                .padding(.top, 10)
        }
        .padding()
        .background(CustomColor.Mint.ignoresSafeArea(edges: .top))
        .accentColor(.white)
    }
}

extension CustomNavigationView {
    
    //MARK: Back Button Nav
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        } ,label: {
            Image(systemName: "chevron.left")
        })
    }
    
    //MARK: Cart icon
    private var cartButton: some View {
        
        CustomNavLink(signalLabel: "Cart", cart: cart, destination: CartScreen(cart: cart)) {
            Image(systemName: "cart" )
                .resizable()
                .frame(width: 25, height: 25, alignment: .trailing)
            
            
            ZStack {
                Circle()
                    .foregroundColor(.red)
                Text("\(cart.cartItems.count)")
                    .foregroundStyle(.white)
                    .font(.custom("TwilioSansMono-Regular", size: 12))
                
            }
            .frame(width: 15, height: 15)
            .opacity(cart.cartItems.count == 0 ? 0 : 1.0)
            .offset(x: -20, y: -10)
            
        }
    }
    
    //MARK: Title section
    private var titleSection: some View {
        VStack(spacing: 4) {
            Image(title)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .padding(.leading, showBackButton ?  0 : 25)
            
            
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}
