//
//  ProductCard.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct ProductCard: View {
    
    var image: String
    var title: String
    var price: Double
    let category: String
    var body: some View {
        VStack {
           productImage
           productDetails
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding([.bottom, .horizontal])
        .shadow(radius: 7)
    }
}

extension ProductCard {
    
    // MARK: product image
    private var productImage: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .cornerRadius(10)
    }
    
    //MARK: product details
    private var productDetails: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(category)
                    .font(.custom("TwilioSansMono-Regular", size: 14))
                    .foregroundColor(CustomColor.Mint)
                Text(title)
                    .font(.custom("TwilioSansMono-Bold", size: 20))
                    .lineLimit(1)
                    .fontWeight(.black)
                    .foregroundColor(CustomColor.DarkGreen)
                Text(String(price))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .layoutPriority(100)

            Spacer()
        }
        .padding()
        .cornerRadius(10)
    }
}
