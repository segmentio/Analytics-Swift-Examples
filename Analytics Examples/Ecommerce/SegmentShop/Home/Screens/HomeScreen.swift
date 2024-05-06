//
//  HomeScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    @ObservedObject var cart: Cart
    
    let collections = collectionData
    @State private var selectedTab: Tab = .house
    
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
                titleText
                heroCarousel
                    .padding(.bottom, 40)
                Spacer()
                productCarousels
                Spacer()
            }
            
            VStack {
                Spacer()
                TabBar(selectedTab: $selectedTab, cart: cart)
            }
        }
        .customNavBarItems(title: "white-logo", backButtonHidden: true)
    }
}

extension HomeScreen {
    
    //MARK: home title text
    private var titleText: some View {
        Text("Popular Collections")
            .font(.custom("TwilioSansMono-Medium", size: 24))
            .foregroundStyle(CustomColor.DarkGreen)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
    }
    
    //MARK: hero carousel
    private var heroCarousel: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(collections) { collection in
                    let title = collection.title
                    
                    if title == "Heros" {
                        ForEach(collection.products) { product in
                            
                            CustomNavLink(cart: cart, destination: CollectionDetailScreen(cart: cart, collection: collection, title: product.title)) {
                                Image(product.title)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 350)
                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                    .shadow(radius: 3)
                                    .padding(.horizontal, 10)
                                    .overlay(
                                        VStack {
                                            Text(product.description)
                                                .font(.custom("TwilioSansMono-Medium", size: 24))
                                                .padding(6)
                                                .foregroundColor(.white)
                                        }
                                            .background(CustomColor.Mint)
                                            .opacity(0.8)
                                            .cornerRadius(10.0)
                                            .padding(20)
                                        
                                        , alignment: .bottomLeading
                                    )
                            }
                        }
                    }
                }
            }
        }
    }
}

// MARK: Product Carousels
extension HomeScreen {
    private var productCarousels: some View {
        
        ForEach(collections) { collection in
            let title = collection.title
            
            if title != "Heros" {
                VStack {
                    CustomNavLink( cart: cart, destination: CollectionDetailScreen(cart: cart, collection: collection, title: title)) {
                        Text("\(title) ->")
                            .font(.custom("TwilioSansMono-Medium", size: 24))
                            .foregroundStyle(CustomColor.DarkGreen)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 25)
                        
                    }
                    ScrollView(.horizontal) {
                        
                        LazyHStack(spacing: 0) {
                            ForEach(collection.products) { product in
                                CustomNavLink(cart: cart, destination: ProductDetailScreen(cart: cart, product: product)) {
                                    ProductCard(image: product.title, title: product.title, price: product.price, category: product.category)
                                        .frame(height: 300)
                                }
                                
                            }
                        }.padding()
                    }
                }.padding()
            }
        }
    }
}

