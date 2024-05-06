//
//  ProfileButton.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

struct ProfileButton: View {
    let title: String
    
    var body: some View {
        VStack {
            imageView
            profileTitle
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 7)
        .padding([.bottom, .horizontal])
    }
}

extension ProfileButton {

    private var imageView: some View {
        var image: String

        switch title {
        case "Orders":
            image = "bag"
        case "Reviews":
            image = "star.bubble"
        case "Deals":
            image = "giftcard"
        case "Settings":
            image = "slider.horizontal.3"
        default:
            image = "bag.fill"
        }
        
        return HStack {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 100, height: 100)
                .padding()
                .foregroundColor(CustomColor.Mint)
            }
    }
    
    private var profileTitle: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.custom("TwilioSansMono-Regular", size: 20))
                .foregroundColor(CustomColor.DarkGreen)
                .frame(alignment: .center)
            Spacer()
        }
        .padding()
        .cornerRadius(10)
    }
}
