//
//  Cart.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import Foundation

struct CartData: Codable {
    var cartItems: [CartItem]
    var totalPrice: Double
    var id: UUID
}

class Cart: ObservableObject {
    
    @Published var cartItems: [CartItem]
    @Published var totalPrice: Double
    
    init(){
        self.cartItems = []
        self.totalPrice = 0
        
    }
    
    func addProduct(product: Product) {
        var addNewProduct = true
        
        for (index, item) in cartItems.enumerated() {
            if item.product.id == product.id {
                cartItems[index].count = cartItems[index].count + 1
                addNewProduct = false
            }
            calculatePrice(product: product, cartItem: cartItems[index])
        }
        if addNewProduct {
            let cartItem = CartItem(product: product, count: 1)
            cartItems.append(cartItem)
            calculatePrice(product: product, cartItem: cartItem)
            mockAddToCart()
        }
    }
    
    func removeProduct(product: Product) {
        for (index, item) in cartItems.enumerated() {
            if item.product.id == product.id {
                if cartItems[index].count > 1 {
                    cartItems[index].count = cartItems[index].count - 1
                    calculatePrice(product: product, cartItem: cartItems[index])

                } else {
                    cartItems.remove(at: index)
                    calculatePrice(product: product)
                }
            }
        }
        mockRemoveFromCart()
     }
    
    func calculatePrice(product: Product, cartItem: CartItem?  = nil) {
        if cartItem?.count != nil {
            self.totalPrice = product.price * Double(cartItem?.count ?? 1)
        } else {
            self.totalPrice = 0
        }
    }
}
