//
//  RootScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct RootScreen: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var viewingProfile = false
    @ObservedObject var cart: Cart
    @StateObject var favorites = Favorites()

    @EnvironmentObject var auth: Auth
    
    var body: some View {
        if auth.loggedIn {
            CustomNavView(cart: cart) {
                HomeScreen(cart: cart)
            }.environmentObject(favorites)
        } else {
            LoginScreen()
        }
    }
}

