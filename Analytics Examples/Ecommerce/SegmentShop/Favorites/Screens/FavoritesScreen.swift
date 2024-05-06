//
//  FavoritesScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct FavoritesScreen: View {
    @ObservedObject var cart: Cart
    @ObservedObject var favorites = Favorites()
    @State private var selectedTab: Tab = .star
    var favoriteProducts: [Product] = []
    
    let collections = collectionData
    
    var body: some View {
        
        ZStack {
            Image("cream_dust")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            Spacer()
            Spacer()
            
            ScrollView {
                Spacer()
                favoritesText
                favoritesListView
            }
            VStack {
                Spacer()
                TabBar(selectedTab: $selectedTab, cart: cart)
                    .padding()
            }
            .padding(10)
        }
        .customNavBarItems(title: "white-logo", backButtonHidden: false)
    }
}

extension FavoritesScreen {
    
    //MARK: favorites title text
    private var favoritesText: some View {
        Text("Favorites")
            .font(.custom("TwilioSansMono-Medium", size: 24))
            .foregroundStyle(CustomColor.DarkGreen)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 35)
    }
    
    //MARK: favorites list view
    private var favoritesListView: some View {
        let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
        
        return LazyVGrid(columns: gridItems, content: {
            ForEach(favorites.products, id: \.self) { product in
                
                ForEach(collections) { collection in
                    ForEach(collection.products) { collectionProduct in
                        if collectionProduct.title == product {
                            CustomNavLink(cart: cart, destination: ProductDetailScreen(cart: cart, product: collectionProduct)) {
                                ProductCard(image: product, title: product, price: collectionProduct.price, category: collectionProduct.category)
                            }
                        }
                    }
                }
            }
        })
    }
}
