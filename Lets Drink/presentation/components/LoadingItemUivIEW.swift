//
//  LoadingItemUiView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 09/06/23.
//

import SwiftUI
struct LoadingItemUiView: View {
    var body: some View {
            ZStack {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                        .padding(.all, 20)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
}
