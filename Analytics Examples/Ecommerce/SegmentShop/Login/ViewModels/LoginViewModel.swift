//
//  LoginViewModel.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var error: APIError?
}

