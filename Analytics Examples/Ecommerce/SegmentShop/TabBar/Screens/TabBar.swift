//
//  TabBar.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case star
    case person
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    @ObservedObject var cart: Cart
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    var body: some View {
        VStack {
            HStack {
                homeButton
                Spacer()
                favoritesButton
                Spacer()
                profileButton
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
        .padding()
    }
}

extension TabBar {
    private var homeButton: some View {
        CustomNavLink(signalLabel: "Home", cart: cart, destination: HomeScreen(cart: cart)) {
            Image(systemName: selectedTab == .house ? fillImage : "house")
                .padding(.leading, 40)
                .scaleEffect(selectedTab == .house ? 1.25 : 1.0)
                .foregroundColor(selectedTab == .house ? CustomColor.Mint : .gray)
                .font(.system(size: 22))
        }
    }
    
    private var favoritesButton: some View {
        CustomNavLink(signalLabel: "Favorites", cart: cart, destination: FavoritesScreen(cart: cart)) {
            Image(systemName: selectedTab == .star ? fillImage : "star")
                .scaleEffect(selectedTab == .star ? 1.25 : 1.0)
                .foregroundColor(selectedTab == .star ? CustomColor.Mint : .gray)
                .font(.system(size: 22))
        }
    }
    
    private var profileButton: some View {
        CustomNavLink(signalLabel: "Profile", cart: cart, destination: ProfileScreen(cart: cart)) {
            Image(systemName: selectedTab == .person ? fillImage : "person")
                .padding(.trailing, 50)
                .foregroundColor(selectedTab == .person ? CustomColor.Mint : .gray)
                .font(.system(size: 22))
                .scaleEffect(selectedTab == .star ? 1.25 : 1.0)
        }
    }
}

