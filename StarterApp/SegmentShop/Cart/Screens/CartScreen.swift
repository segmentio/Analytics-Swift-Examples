//
//  CartScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct CartScreen: View {
    @ObservedObject var cart: Cart
    let collections = collectionData
    
    var body: some View {
        ZStack {
            Image("cream_dust")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            if !cart.cartItems.isEmpty {
                ScrollView {
                    titleText
                    cartProductsList
                }
                .padding(.top, 10)
                
                VStack {
                    Spacer()
                    totalPrice
                    checkoutButton
                }
                .frame(maxWidth: .infinity, alignment: .bottom)
                .padding(.bottom, 40)
            } else {
                emptyCartText
            }
            
        }
        .customNavBarItems(title: "white-logo", backButtonHidden: false)
        .onAppear {
            fetchCart()
        }
    }
}

extension CartScreen {
    
    //MARK: cart products
    private var cartProductsList: some View {
        ForEach(cart.cartItems) {cartItem in
            ForEach(collections) { collection in
                ForEach(collection.products) { collectionProduct in
                    if collectionProduct.id == cartItem.product.id  {
                        CustomNavLink(cart: cart, destination: ProductDetailScreen(cart: cart, product: collectionProduct)) {
                            CartItemCard(product: collectionProduct, quantity: cartItem.count,  cart: cart)
                        }
                    }
                    
                }
            }
        }
    }
    
    //MARK: checkout button
    private var checkoutButton: some View {
        CustomNavLink(cart: cart, destination: CheckoutUserInfoScreen(cart: cart)) {
            Text("Checkout")
                .font(.custom("TwilioSansMono-Bold", size: 24))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(Color.white)
                .background(CustomColor.Mint)
                .cornerRadius(10)
                .padding()
                .padding([.leading, .trailing], 15)
        }.onTapGesture {
            fetchCheckoutData()
        }
    }
    
    private var titleText: some View {
        Text("Cart")
            .font(.custom("TwilioSansMono-Medium", size: 24))
            .foregroundStyle(CustomColor.DarkGreen)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 35)
    }
    
    private var emptyCartText: some View {
        Text("Cart is empty")
            .font(.custom("TwilioSansMono-Semibold", size: 20))
            .foregroundStyle(CustomColor.DarkGreen)
        
    }
    
    private var totalPrice: some View {
        HStack {
            Text("Total:")
                .font(.custom("TwilioSansMono-regular", size: 16))
                .foregroundStyle(CustomColor.Mint)
            Text("$ \(cart.totalPrice, specifier: "%.2f")")
                .font(.custom("TwilioSansMono-Semibold", size: 20))
                .foregroundStyle(CustomColor.DarkGreen)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 30)

    }
}
