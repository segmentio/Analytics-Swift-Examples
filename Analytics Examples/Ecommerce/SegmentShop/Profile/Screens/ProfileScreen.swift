//
//  ProfileScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct ProfileScreen: View {
    
    let profileOptions: [String] = ["Orders", "Reviews", "Deals", "Settings"]
    let gridItems = [GridItem(.fixed(200)), GridItem(.fixed(200))]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count:2 )
    
    @ObservedObject var viewModel: ProfileViewModel = ProfileViewModel()
    @State private var viewingProfile = false
    @ObservedObject var cart: Cart
    
    var body: some View {
        profileTitle
        profileChoices
            .padding()
        logoutButton
            .customNavBarItems(title: "white-logo")
        Spacer()
    }
}

extension ProfileScreen {
    
    // MARK: profile title
    private var profileTitle: some View {
        Text("Your Profile")
            .font(.custom("TwilioSansMono-Medium", size: 24))
            .foregroundStyle(CustomColor.DarkGreen)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
    }
    
    // MARK: profile options
    private var profileChoices: some View {
        LazyVGrid(columns: columns, spacing: 0){
            
            ForEach(profileOptions, id: \.self) { option in
                
                CustomNavLink(cart: cart, destination: ProfileOptionDetailScreen(option: option)) {
                    ProfileButton(title: option)
                }
            }
        }
    }
    
    // MARK: logout Button 
    private var logoutButton: some View {
        Button(action: viewModel.logout) {
            Text("Logout")
                .font(.custom("TwilioSansMono-Bold", size: 24))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(Color.white)
                .background(CustomColor.Mint)
                .cornerRadius(10)
                .padding(.top, 50)
                .padding([.leading, .trailing], 15)
        }
        .frame(width: 400)
    }
}
