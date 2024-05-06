//
//  Carousel.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct Carousel: View {
    
    let collection: Collection
    @ObservedObject var cart: Cart
    
    
    var body: some View {
        ScrollView(.horizontal) {
            ForEach(collection.products) { product in
                
                CustomNavLink(cart: cart, destination: CollectionDetailScreen(cart: cart, collection: collection, title: product.title)) {
                    Image(product.title)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}
