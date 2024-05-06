//
//  ProductDetailScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI
import Segment

struct ProductDetailScreen: View {
    @ObservedObject var cart: Cart
    let product: Product
    @EnvironmentObject var favorites: Favorites
    
    
    var body: some View {
        ZStack {
            Image("cream_dust")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            Spacer()
            Spacer()
            VStack {
                ScrollView {
                    heroImage
                    Spacer()
                    productTitle
                    productPrice
                    productDescription
                    Spacer()
                        .padding(.bottom, 50)
                    addProductButton
                }
            }
        }
        .customNavBarItems(title: "white-logo")
        .onAppear {
            fetchProduct(product: product.title)
        }
    }
}

extension ProductDetailScreen {
    
    //MARK: product image
    private var heroImage: some View {
        Image(product.title)
            .resizable()
            .frame(height: 300, alignment: .center)
            .shadow(radius: 10)
            .padding([.leading, .trailing], 2)
            .overlay(
                HStack {
                    VStack {
                        Text(product.category)
                            .font(.custom("TwilioSansMono-Regular", size: 16))
                            .padding(6)
                            .foregroundColor(.white)
                    }
                    .background(CustomColor.Mint)
                    .opacity(0.8)
                    .cornerRadius(10.0)
                    .padding(20)
                    
                    VStack {
                        favoriteIcon
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 25)
                }
                    .onAppear {
                        let properties = [
                            "product": product.title,
                            "price": product.price,
                            "id": product.id,
                            "category": product.category
                        ] as [String : Any]
                        
                        Analytics.main.track(name: "Product Clicked", properties: properties)
                        Analytics.main.track(name: "Product Viewed", properties: properties)
                    }
                , alignment: .bottomLeading
            )
    }
    
    //MARK: "favorite" icon
    private var favoriteIcon : some View {
        var icon: Image;
        let inFavorites = favorites.contains(product)
        if inFavorites {
            icon = Image(systemName: "star.fill")
        } else {
            icon = Image(systemName: "star")
        }
        return ZStack {
            Button(action: {
                if favorites.contains(product) {
                    favorites.remove(product)
                    
                } else {
                    favorites.add(product)
                }
            }) {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundStyle(CustomColor.Mint)
                    .shadow(radius: 10)
            }
        }
        .frame(width: 30, height: 30)
        
    }
    
    //MARK: Product details
    private var productTitle: some View {
        VStack {
            Text(product.title)
                .font(.custom("TwilioSansMono-Semibold", size: 24))
                .foregroundStyle(CustomColor.DarkGreen)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
    
    private var productPrice: some View {
        VStack {
            Text("$\(String(product.price))")
                .font(.custom("TwilioSansMono-Regular", size: 16))
                .foregroundStyle(CustomColor.Mint)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .trailing, .bottom], 15)
    }
    
    private var productDescription: some View {
        VStack {
            Text(product.description)
                .font(.custom("TwilioSansMono-Regular", size: 14))
                .foregroundStyle(CustomColor.DarkGreen)
                .lineSpacing(10)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .trailing, .bottom], 15)
    }
    
    private var addProductButton: some View {
        Button(action: {cart.addProduct(product: product)}) {
            Text("Add To Cart")
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

