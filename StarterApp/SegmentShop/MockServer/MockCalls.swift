//
//  FetchMessage.swift
//  SegmentShop
//
//  Created by Alan Charles on 3/13/24.
//

import Foundation

struct Message: Codable {
    var text: String
}

struct UserCredentials: Codable {
    var username: String
    var password: String
}

func login(guest: Bool) {
    var url: URL? = nil
    if guest == false {
        url = URL(string: "http://localhost:8080/login")
    } else {
        url = URL(string: "http://localhost:8080/guest-login")
    }
    
    if let url {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let data = data {
                    do { let userInfo = try JSONDecoder().decode(LoginResponse.self, from: data)
                        let traits = [ "userName": userInfo.userName]

                    } catch {
                        print("Failed to decode JSON")
                    }
                    
                    DispatchQueue.main.async {
                        Auth.shared.setCredentials(
                            accessToken: accessToken,
                            refreshToken: refreshToken
                        )
                    }
                }
            } else {
                print("Error: Invalid response")
            }
        }
        task.resume()
    }
}

func fetchCategory(category: String) {
    if let url = URL(string: "http://localhost:8080/categories/\(category)") {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Invalid response or status code.")
                return
            }
            

            guard let data = data else {
                print("Error: No data received.")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                //handle the data if ya need it
            } else {
                print("Failed to convert data to text.")
            }
        }
        
        task.resume()
    } else {
        print("Invalid URL.")
    }
}

func fetchProduct(product: String) {
    if let url = URL(string: "http://localhost:8080/products/\(product)") {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Invalid response or status code.")
                return
            }
            

            guard let data = data else {
                print("Error: No data received.")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
             //handle the data if ya need it 
            } else {
                print("Failed to convert data to text.")
            }
        }
        
        task.resume()
    } else {
        print("Invalid URL.")
    }
}

func mockAddToCart() {
    if let url = URL(string: "http://localhost:8080/cart/add") {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Invalid response or status code.")
                return
            }

            guard let data = data else {
                print("Error: No data received.")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                //handle the data if ya need it
                print("****JSON CART ADD**** \(jsonString)")

            } else {
                print("Failed to convert data to text.")
            }
        }
        
        task.resume()
    } else {
        print("Invalid URL.")
    }
}

func mockRemoveFromCart() {
    if let url = URL(string: "http://localhost:8080/cart/remove") {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Invalid response or status code.")
                return
            }

            guard let data = data else {
                print("Error: No data received.")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                //handle the data if ya need it
            } else {
                print("Failed to convert data to text.")
            }
        }
        
        task.resume()
    } else {
        print("Invalid URL.")
    }
}

func fetchCart() {
    if let url = URL(string: "http://localhost:8080/cart") {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Invalid response or status code.")
                return
            }

            guard let data = data else {
                print("Error: No data received.")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                //handle the data if ya need it
            } else {
                print("Failed to convert data to text.")
            }
        }
        
        task.resume()
    } else {
        print("Invalid URL.")
    }
}

func fetchUserInfo() {
    if let url = URL(string: "http://localhost:8080/user-info") {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Invalid response or status code.")
                return
            }

            guard let data = data else {
                print("Error: No data received.")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                //handle the data if ya need it
            } else {
                print("Failed to convert data to text.")
            }
        }
        
        task.resume()
    } else {
        print("Invalid URL.")
    }
}


func fetchCheckoutData() {
    if let url = URL(string: "http://localhost:8080/checkout") {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Invalid response or status code.")
                return
            }

            guard let data = data else {
                print("Error: No data received.")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                //handle the data if ya need it
            } else {
                print("Failed to convert data to text.")
            }
        }
        
        task.resume()
    } else {
        print("Invalid URL.")
    }
}
