//
//  HomeViewModel.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import Foundation


class HomeViewModel: ObservableObject {

    func logout() {
        Auth.shared.logout()
    }
}
