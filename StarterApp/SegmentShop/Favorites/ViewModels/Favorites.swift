//
//  Favorites.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

class Favorites: ObservableObject, Codable {
    
    var products: [String]
    
    private var saveKey = "Favorites"
    
    init() {
        self.products = []
        loadData()
    }
    
    func contains(_ product: Product) -> Bool {
        products.contains(product.title)
    }
    
    func add(_ product: Product) {
        objectWillChange.send()
        
        products.append(product.title)
        save()
    }
    
    func remove(_ product: Product) {
        objectWillChange.send()
        let filteredProducts = products.filter {$0 != product.title}
        
        products = filteredProducts
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(products)
            UserDefaults.standard.set(data, forKey: saveKey)

        } catch (let error) {
            print("Error on saving: \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        print("Loading data...")
        
        do {
            if let data = UserDefaults.standard.data(forKey: saveKey) {
                let decoded = try JSONDecoder().decode([String].self, from: data)
                self.products = decoded
                
            }
        } catch (let error) {
            print("Error on saving: \(error.localizedDescription)")
        }
    }
}
