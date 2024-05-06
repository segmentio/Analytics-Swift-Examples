//
//  OrderCompletedScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct OrderCompletedScreen: View {
    @ObservedObject var cart: Cart
    
    var body: some View {
        ZStack {
            Image("cream_dust")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    LogoComponent("logo")
                        .frame(width: 250, height: 250)
                }
                VStack {
                    orderCompletedTitle
                    checkoutInfoText
                    returnHomeButton
                }
                .padding()
                Spacer()
            }

        }
        .customNavBarItems(title: "white-logo", backButtonHidden: true)
    }
}

extension OrderCompletedScreen {
    
    //MARK: order Completed title text
    private var orderCompletedTitle: some View {
        Text("Thanks for your Order!")
            .font(.custom("TwilioSansMono-Bold", size: 24))
            .foregroundStyle(CustomColor.DarkGreen)
            .padding([.leading, .top], 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    public var checkoutInfoText: some View {
        Text("We really appreciate it! Look out for a confirmation with tracking information in your email within the next 24 hours. Thanks again!")
            .font(.custom("TwilioSansMono-regular", size: 18))
            .foregroundStyle(CustomColor.DarkGreen)
            .padding([.leading, .top], 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    //MARK: home button
    public var returnHomeButton: some View {
        CustomNavLink(cart: cart, destination: HomeScreen(cart: cart)) {
            Text("Home")
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
