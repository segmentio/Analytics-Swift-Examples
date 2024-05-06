//
//  SwiftUIView.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import SwiftUI

extension View {
    
    public func appBar(title: String, backButtonAction: @escaping() -> Void) -> some View {
        
        self
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                backButtonAction()
            }) {
                Image(.creamDust) // set backbutton image here
                    .renderingMode(.template)
                    .foregroundColor(CustomColor.Mint)
            })
    }
}
