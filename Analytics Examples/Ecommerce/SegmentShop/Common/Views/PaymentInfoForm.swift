//
//  PaymentInfoForm.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI
import Segment

struct PaymentInfoForm: View {
    @State private var cardholderName: String = ""
    @State private var cardNumber: String = ""
    @State private var expMonth: String = ""
    @State private var expYear: String = ""
    @State private var cvc: String = ""
    @State private var zipCode: String = ""
    
    
    var body: some View {
        VStack {
            VStack {
                paymentTitle
                nameInput
                cardNumberInput
            }.padding([.leading, .trailing], 10)
            HStack {
                Spacer()
                HStack {
                    Spacer()
                    expirationMonthInput
                    Text("/")
                        .font(.custom("TwilioSansMono-Regular", size: 14))
                    expirationYearInput
                    Spacer()
                }
                HStack {
                    Spacer()
                    zipCodeInput
                    cvcInput
                    Spacer()
                }
                Spacer()
            }
            .onDisappear {
                let properties = [
                    "cardholderName": cardholderName,
                    "cardNumber": cardNumber,
                    "expMonth": expMonth,
                    "expYear": expYear,
                    "cvc": cvc,
                    "zipcode": zipCode
                ]
                Analytics.main.track(name: "Payment Info Entered", properties: properties)
            }
            .padding(10)
        }
    }
}

extension PaymentInfoForm {
    
    //MARK: payment title text
    private var paymentTitle: some View {
        Text("Payment Information")
            .font(.custom("TwilioSansMono-Medium", size: 20))
            .foregroundStyle(CustomColor.Mint)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .bottom,], 10)
    }
    
    
    //MARK: name input fields
    private var nameInput: some View {
        VStack {
            TextField("", text: $cardholderName, prompt: Text("Name on Card").foregroundStyle(CustomColor.DarkGreen))
                .font(.custom("TwilioSansMono-Regular", size: 14))
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    //MARK: card details input fields
    private var cardNumberInput: some View {
        VStack {
            TextField("", text: $cardNumber, prompt: Text("Card Number").foregroundStyle(CustomColor.DarkGreen))
                .font(.custom("TwilioSansMono-Regular", size: 14))
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var expirationMonthInput: some View {
        VStack {
            TextField("", text: $expMonth, prompt: Text("08").foregroundStyle(CustomColor.DarkGreen))
                .font(.custom("TwilioSansMono-Regular", size: 14))
            Divider()
        }
    }
    
    private var expirationYearInput: some View {
        VStack {
            TextField("", text: $expYear, prompt: Text("26").foregroundStyle(CustomColor.DarkGreen))
                .font(.custom("TwilioSansMono-Regular", size: 14))
            Divider()
        }
    }
    
    private var zipCodeInput: some View {
        VStack {
            TextField("", text: $zipCode, prompt: Text("Zip Code").foregroundStyle(CustomColor.DarkGreen))
                .font(.custom("TwilioSansMono-Regular", size: 14))
            Divider()
        }
    }
    
    private var cvcInput: some View {
        VStack {
            TextField("", text: $cvc, prompt: Text("CVC").foregroundStyle(CustomColor.DarkGreen))
                .font(.custom("TwilioSansMono-Regular", size: 14))
            Divider()
        }
    }
}
