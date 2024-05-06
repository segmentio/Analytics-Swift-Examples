//
//  MockData.swift
//  SegmentShop
//
//  Created by Alan Charles on 3/27/24.
//

import Foundation
import Peasy

let collections = collectionData
let headers: Set<Response.Header> = [.init(name: "Content-Type", value: "application/json")]
let loginInfo = LoginResponse(userName: "user123", password: "pass123", userId: UUID())
let guestLogin = LoginResponse(userName: "guest", password: "guest", userId: nil)

struct ContactInfo: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var phone: Int
    var street: String
    var city: String
    var state: String
    var country: String
}

let contactInfo: ContactInfo = ContactInfo(firstName: "Frodo", lastName: "Baggins", email: "frodo@bagend.net", phone: 8675309, street: "Bagshot Row", city: "Hobbiton", state:"SH", country: "MD")

struct CheckoutStartedData: Codable {
    var cartData: CartData
    var started: Bool
}

let checkoutStarted: CheckoutStartedData = CheckoutStartedData(cartData: cartData, started: true)
let addedItem: CartItem = CartItem(product: collections[0].products[3], count: 4)
let removedItem: CartItem = CartItem(product: collections[0].products[3], count: 2)
let cartItems: [CartItem] = [CartItem(product: collections[0].products[3], count: 3),
                             CartItem(product: collections[2].products[5], count: 1),
                             CartItem(product: collections[1].products[2], count: 2)]
let cartData: CartData = CartData(cartItems: cartItems, totalPrice: 10393.93, id: UUID())

func jsonifyData<T: Encodable>(data: T) -> Data? {
    do {
        let jsonData = try JSONEncoder().encode(data)
        return jsonData
    } catch {
        print("Failed to encode data to JSON:", error)
        return nil
    }
}
