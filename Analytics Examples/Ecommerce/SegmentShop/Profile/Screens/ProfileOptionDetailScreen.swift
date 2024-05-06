//
//  ProfileOptionDetailScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct ProfileOptionDetailScreen: View {
    let option: String
    
    var body: some View {
        VStack {
            if option == "Settings" {
                CustomerInfoForm()
            } else {
                Text(option)
            }
        }.customNavBarItems(title: "white-logo", backButtonHidden: false)
    }
}
