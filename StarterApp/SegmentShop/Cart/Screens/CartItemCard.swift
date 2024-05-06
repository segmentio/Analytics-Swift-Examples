//
//  CartItemCard.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct CartItemCard: View {
    var product: Product
    var image: String
    var title: String
    var price: Double
    let category: String
    let quantity: Int
    let cart: Cart
    let calculatedPrice: Double
    
    
    init(product: Product, quantity: Int, cart: Cart) {
        self.product = product
        self.image = product.title
        self.title = product.title
        self.price = product.price
        self.quantity = quantity
        self.category = product.category
        self.cart = cart
        self.calculatedPrice = price * Double(quantity)
    }
    
    var body: some View {
        HStack {
            cartItemImage
            Spacer()
            cartItemDetails
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .padding([.leading, .trailing], 5)
    }
}

extension CartItemCard {
    
    //MARK: cart item image
    private var cartItemImage: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .frame(width: 150, height: 150)
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding()
        .shadow(radius: 7)
    }
    
    //MARK: cart item details
    private var cartItemDetails: some View {
        HStack() {
            VStack(alignment: .trailing) {
                Text(category)
                    .font(.custom("TwilioSansMono-Regular", size: 14))
                    .foregroundColor(CustomColor.Mint)
                    .multilineTextAlignment(.trailing)
                Text(title)
                    .font(.custom("TwilioSansMono-Bold", size: 20))
                    .lineLimit(1)
                    .fontWeight(.black)
                    .foregroundColor(CustomColor.DarkGreen)
                Spacer()
                quantityButtons
                    .padding(.bottom, 10)
                productPrice
                    .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Spacer()
        }
        .padding()
    }
    
    //MARK: product quantity
    private var quantityButtons: some View {
        HStack {
            Text("Quantity:")
                .font(.caption)
                .foregroundColor(.secondary)
            Button(action: {cart.removeProduct(product: product)})  {
                Text("-")
                    .font(.custom("TwilioSansMono-Semibold", size: 16))
                    .foregroundStyle(CustomColor.DarkGreen)
            }
            Text(String(quantity))
                .font(.custom("TwilioSansMono-Semibold", size: 18))
                .foregroundStyle(CustomColor.Mint)
            Button(action: {cart.addProduct(product: product)})  {
                Text("+")
                    .font(.custom("TwilioSansMono-Semibold", size: 16))
                    .foregroundStyle(CustomColor.DarkGreen)
            }
        }
    }
    
    private var productPrice: some View {
        HStack {
            Text("Total:")
                .font(.caption)
                .foregroundColor(.secondary)
            Text("$ \(String(calculatedPrice))")
                .font(.custom("TwilioSansMono-Semibold", size: 18))
                .foregroundStyle(CustomColor.Mint)
        }
    }
}
