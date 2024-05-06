//
//  LoginScreen.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI
import AVKit

struct LoginScreen: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Image("cream_dust")
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                logoComponent
                
                Spacer()
                    .frame(height: 75)
                
                loginFields
                Spacer()
                    .frame(height: 100)
                
                if viewModel.error != nil {
                    Text("Login error")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
                
                loginButton
                guestButton
                
                Spacer()
                    .frame(height: 100)
            }
            .padding(30)
            .background(
                Image("cream_dust")
                    .resizable(resizingMode: .tile)
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

extension LoginScreen {
    
    //MARK: Logo component
    public var logoComponent: some View {
        VStack {
            LogoComponent("logo")
                .frame(width: 250, height: 250)
            HStack {
                Text("Segment")
                    .font(.custom("TwilioSansMono-Medium", size: 24))
                    .foregroundColor(CustomColor.DarkGreen)
                    .multilineTextAlignment(.center)
                Text("Shop")
                    .font(.custom("TwilioSansMono-RegularItl", size: 24))
                    .foregroundColor(CustomColor.Mint)
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    //MARK: login inputs
    public var loginFields: some View {
        VStack {
            TextField(
                "Username",
                text: $viewModel.username
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(.top, 20)
            
            Divider()
                .background(CustomColor.DarkGreen)
            
            SecureField(
                "Password",
                text: $viewModel.password
            )
            .padding(.top, 20)
            
            Divider()
                .background(CustomColor.DarkGreen)
            
        }
    }
    
    //MARK: login button
    public var loginButton: some View {
        Button(action: {login(guest: false)}) {
            Text("Login")
                .font(.custom("TwilioSansMono-Bold", size: 24))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(Color.white)
                .background(CustomColor.Mint)
                .cornerRadius(10)
                .padding(.top, 50)
                .padding([.leading, .trailing], 15)
        }
    }
    
    //MARK: guest login
    public var guestButton: some View {
        Button(
            action: {login(guest: true)},
            label: {
                Text("Continue as a guest")
                    .font(.custom("TwilioSansMono-RegularItl", size: 14))
                    .foregroundColor(CustomColor.DarkGreen)
                    .background(.clear)
                    .underline()
            }
        )
        .padding(.top, 10)
    }
}
