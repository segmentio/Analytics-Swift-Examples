//
//  MockServer.swift
//  SegmentShop
//
//  Created by Alan Charles on 3/13/24.
//

import Foundation
import Peasy

private let server = Server()

func createLoginResponse<T: Codable>(from model: T) -> Response? {
    guard let jsonData = jsonifyData(data: model) else { return nil }
    return Response(status: .ok, headers: headers, body: jsonData)
}

internal func startServer() {
    server.start(port: 8080)
    
    if let loginResponse = createLoginResponse(from: loginInfo) {
        server.respond(with: loginResponse, when: .path(matches: "/login"))
    }
    
    if let guestLoginResponse = createLoginResponse(from: guestLogin) {
        server.respond(with: guestLoginResponse, when: .path(matches: "/guest-login"))
    }
    
    server.respond(with: { request in
        if let response = handleCategory(collectionTitle: request["category"]) {
            return response
        } else {
            return Response(status: .notFound)
        }
    }, when: .path(matches: "/categories/:category"))
    
    server.respond(with:  { request in
        if let response = handleProuct(productTitle: request["product"]) {
            return response
        } else {
            return Response(status: .notFound)
        }
    }, when: .path(matches: "/products/:product"))
    
    guard let jsonAddToCartData = jsonifyData(data: addedItem) else { return }
    server.respond(with: Response(status: .ok, headers: headers, body: jsonAddToCartData), when: .path(matches: "/cart/add"))
    
    guard let jsonRemoveFromCartData = jsonifyData(data: removedItem) else { return }
    server.respond(with: Response(status: .ok, headers: headers, body: jsonRemoveFromCartData), when: .path(matches: "/cart/remove"))
    
    guard let jsonCartData = jsonifyData(data: cartData) else { return }
    server.respond(with: Response(status: .ok, headers: headers, body: jsonCartData), when: .path(matches: "/cart"))
    
    guard let jsonContactInfo = jsonifyData(data: contactInfo) else { return }
    server.respond(with: Response(status: .ok, headers: headers, body: jsonContactInfo), when: .path(matches: "user-info"))
    
    guard let jsonCheckoutStarted = jsonifyData(data: checkoutStarted) else { return }
    server.respond(with: Response(status: .ok, headers: headers, body: jsonCheckoutStarted), when: .path(matches: "checkout"))

}

func handleCategory(collectionTitle: String)  -> Response? {
    let selectedCollection = collections.first { $0.title == collectionTitle }
    guard let jsonData = jsonifyData(data: selectedCollection ) else { return nil }
    let response = Response(status: .ok, headers: headers, body: jsonData)
    return Response(status: .ok, headers: headers, body: jsonData)
}

func handleProuct(productTitle: String) -> Response? {
    for collection in collections {
        if let selectedProduct = collection.products.first(where: { $0.title == productTitle })  {
            guard let jsonData = jsonifyData(data: selectedProduct) else { return nil }
            return Response(status: .ok, headers: headers, body: jsonData)
        }
    }
    return Response(status: .notFound)
}
