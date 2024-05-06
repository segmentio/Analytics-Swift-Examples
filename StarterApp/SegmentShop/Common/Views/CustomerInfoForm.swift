//  CustomerInfoForm.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct CustomerInfoForm: View {
    @ObservedObject var customerInfo = CustomerInfoViewModel()
    var accessToken: String = ""

    private let textFieldLength:CGFloat = 200
    
    init() {
        self.accessToken = Auth.shared.getAccessToken() ?? ""
        customerInfo.loadData()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    contactTitle
                    nameInputs
                    Spacer()
                    contactInputs
                    Spacer()
                }
                .padding(10)
                VStack {
                    addressTitle
                    addressInputs
                }
                .padding(10)
            }.padding()
            saveInfoButton
        }
    }
}

extension CustomerInfoForm {
    
    //MARK: contact title text
    private var contactTitle: some View {
        Text("Contact Information")
            .font(.custom("TwilioSansMono-Medium", size: 20))
            .foregroundStyle(CustomColor.Mint)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 15)
    }
    
    //MARK: name input fields
    private var nameInputs: some View {
        HStack {
            VStack {
                TextField("", text: $customerInfo.firstName, prompt: Text("First Name").foregroundStyle(CustomColor.DarkGreen))
                    .frame(width: 175, height: 30)
                    .font(.custom("TwilioSansMono-Regular", size: 14))
                Divider().frame(width: 175, height: 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                TextField("", text: $customerInfo.lastName, prompt: Text("Last Name").foregroundStyle(CustomColor.DarkGreen))
                    .frame(width: 175, height: 30)
                    .font(.custom("TwilioSansMono-Regular", size: 14))
                Divider().frame(width: 175, height: 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.bottom, 20)
    }
    
    //MARK: contact input fields
    private var contactInputs: some View {
        HStack {
            VStack {
                TextField("", text: $customerInfo.email, prompt: Text("Email").foregroundStyle(CustomColor.DarkGreen))
                    .frame(width: 175, height: 30)
                    .font(.custom("TwilioSansMono-Regular", size: 14))
                Divider().frame(width: 175, height: 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                TextField("", text: $customerInfo.phone, prompt: Text("Phone").foregroundStyle(CustomColor.DarkGreen))
                    .frame(width: 175, height: 30)
                    .font(.custom("TwilioSansMono-Regular", size: 14))
                Divider().frame(width: 175, height: 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.bottom, 20)
        
    }
    
    //MARK: address title text
    private var addressTitle: some View {
        Text("Shipping Details")
            .font(.custom("TwilioSansMono-Medium", size: 20))
            .foregroundStyle(CustomColor.Mint)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 15)
    }
    
    //MARK: address input fields
    private var addressInputs: some View {
        VStack {
            HStack {
                VStack {
                    TextField("", text: $customerInfo.street, prompt: Text("Street").foregroundStyle(CustomColor.DarkGreen))
                        .frame(width: 175, height: 30)
                        .font(.custom("TwilioSansMono-Regular", size: 14))
                    Divider().frame(width: 175, height: 2)
                }
                VStack {
                    TextField("", text: $customerInfo.city, prompt: Text("City").foregroundStyle(CustomColor.DarkGreen))
                        .frame(width: 175, height: 30)
                        .font(.custom("TwilioSansMono-Regular", size: 14))
                    Divider().frame(width: 175, height: 2)
                }
            }
            .padding(.bottom, 20)
            HStack {
                VStack {
                    TextField("", text: $customerInfo.state, prompt: Text("State").foregroundStyle(CustomColor.DarkGreen))
                        .frame(width: 175, height: 30)
                        .font(.custom("TwilioSansMono-Regular", size: 14))
                    Divider().frame(width: 175, height: 2)
                }
                VStack {
                    TextField("", text: $customerInfo.country, prompt: Text("Country").foregroundStyle(CustomColor.DarkGreen))
                        .frame(width: 175, height: 30)
                        .font(.custom("TwilioSansMono-Regular", size: 14))
                    Divider().frame(width: 175, height: 2)
                }
            }
        }
    }
    
    private var saveInfoButton: some View {
        Button(action: customerInfo.saveUserInfo) {
            Text("Save Info")
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
        .alert(isPresented: $customerInfo.showingSavedAlert) {
            if self.accessToken != "guestToken" {
                Alert(title: Text("Your info has been saved!"))

            } else {
                Alert(
                    title: Text("No Account"),
                    message: Text("Create an Account to save user information")
                )
            }
        }
    }
}
