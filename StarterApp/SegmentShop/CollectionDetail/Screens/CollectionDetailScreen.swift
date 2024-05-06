//
//  CollectionDetailScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct CollectionDetailScreen: View {
    let collection: Collection
    let title: String
    @ObservedObject var cart: Cart
    
    init(cart: Cart, collection: Collection, title: String) {
        self.collection = collection
        self.title = title
        self.cart = cart
    }
    
    var body: some View {
        ZStack {
            Spacer()
            displayCollection
        }
        .customNavBarItems(title: "white-logo")
    }
}


extension CollectionDetailScreen {
    
    //MARK: display collection logic
    private var displayCollection: some View {
        var collection: Collection
        let collectionTitle: String
        
        let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

        switch self.title {
        case "gizmo-hero":
            collection = collectionData[1]
            collectionTitle = "Gizmos"
        case "widget-hero":
            collection = collectionData[0]
            collectionTitle = "Widgets"
        case "trinket-hero":
            collection = collectionData[2]
            collectionTitle = "Gizmos"
        default:
            collection = collectionData[0]
            collectionTitle = self.title

        }
        
        return ScrollView {
            Text(collection.title)
                .font(.custom("TwilioSansMono-Medium", size: 24))
                .foregroundStyle(CustomColor.DarkGreen)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading])
            LazyVGrid(columns: gridItems, content: {
                ForEach(collection.products) { product in
                    CustomNavLink(cart: cart, destination: ProductDetailScreen(cart: cart, product: product)){
                        ProductCard(image: product.title, title: product.title, price: product.price, category: product.category)
                    }
                }
            })
            .onAppear {
            
                    fetchCategory(category: collectionTitle)
                
            }
        }.padding()
    }
}
