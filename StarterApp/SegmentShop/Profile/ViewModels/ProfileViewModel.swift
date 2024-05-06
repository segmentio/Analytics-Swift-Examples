//
//  ProfileViewModel.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import Foundation

class ProfileViewModel: ObservableObject {

    func logout() {
        Auth.shared.logout()
    }
}
