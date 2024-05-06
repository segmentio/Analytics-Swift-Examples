//
//  CustomerInfoViewModel.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/16/24.
//

import Foundation
import Segment

class CustomerInfoViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published  var phone: String = ""
    @Published var street: String = ""
    @Published var city: String = ""
    @Published var state: String = ""
    @Published var country: String = ""
    @Published var showingSavedAlert: Bool = false
    
    internal let userDefaults = UserDefaults(suiteName: "group.com.segment.segmentShop")
    

    func saveUserInfo() {
        userDefaults?.set(firstName, forKey: "firstName")
        userDefaults?.set(lastName, forKey: "lastName")
        userDefaults?.set(email, forKey: "email")
        userDefaults?.set(phone, forKey: "phone")
        userDefaults?.set(street, forKey: "street")
        userDefaults?.set(city, forKey: "city")
        userDefaults?.set(state, forKey: "state")
        userDefaults?.set(country, forKey: "country")
       
        showingSavedAlert = true
        
        let traits: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phone": phone,
            "street": street,
            "city": city,
            "state": state,
            "country": country
        ]
        
        let userId = Analytics.main.userId ?? nil
        
        if userId != nil {
            Analytics.main.identify(userId: userId!, traits: traits)
        }
    }
    
    func validateFields() -> Bool {
        guard !firstName.isEmptyOrWhitespace else { return false }
        guard !lastName.isEmptyOrWhitespace else { return false }
        guard !email.isEmptyOrWhitespace, email.isValidEmail else { return false }
        guard !phone.isEmptyOrWhitespace else { return false }
        
        return true
    }
    
    func loadData() {
        firstName = userDefaults?.string(forKey: "firstName") ?? ""
        lastName = userDefaults?.string(forKey: "lastName") ?? ""
        email = userDefaults?.string(forKey: "email") ?? ""
        phone = userDefaults?.string(forKey: "phone") ?? ""
        street = userDefaults?.string(forKey: "street") ?? ""
        city = userDefaults?.string(forKey: "city") ?? ""
        state = userDefaults?.string(forKey: "state") ?? ""
        country = userDefaults?.string(forKey: "country") ?? ""
        
        let userInfo =  [
           "firstName": firstName,
           "lastName": lastName,
           "email": email,
           "phone": phone,
           "street": street,
           "country": country,
       ]
       
    }
}

extension String {
    var isEmptyOrWhitespace: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
