//
//  CheckoutUserInfoScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct CheckoutUserInfoScreen: View {
    @ObservedObject var cart: Cart

    var body: some View {
        
        ScrollView {
            checkoutInfoTitle
            VStack {
                CustomerInfoForm()
                    .padding(.bottom, 30)
                PaymentInfoForm()
                    .padding(.bottom, 30)
            }
        
            VStack {
                orderCompletedButton
                    .padding()
                
            }
            .frame(maxWidth: .infinity, alignment: .top)
            Spacer()
        }
        .customNavBarItems(title: "white-logo", backButtonHidden: false)
        .onAppear {
            fetchCheckoutData()
            fetchUserInfo()
        }
    }
}

extension CheckoutUserInfoScreen {
    
    //MARK: checkout info title text
    private var checkoutInfoTitle: some View {
        Text("Place your Order")
            .font(.custom("TwilioSansMono-Bold", size: 24))
            .foregroundStyle(CustomColor.DarkGreen)
            .padding([.leading, .top], 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    //MARK: complete order button
    private var orderCompletedButton: some View {
        CustomNavLink(cart: cart, destination: OrderCompletedScreen(cart: cart)) {
            Text("Complete Purchase")
                .font(.custom("TwilioSansMono-Bold", size: 24))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(Color.white)
                .background(CustomColor.Mint)
                .cornerRadius(10)
                .padding(.top, 50)
                .padding([.leading, .trailing], 15)
        }
    }
}


