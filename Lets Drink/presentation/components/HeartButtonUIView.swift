//
//  HeartButtonUIView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI
struct HeartButtonUIView: View {
    @Binding var isLiked: Bool
    private let animationDuration: Double = 0.1
    private var animationScale: CGFloat {
        isLiked ? 0.7 : 1.3
    }
    @State private var animate = false
    var body: some View {
        Button(action: {
            self.isLiked.toggle()
        }, label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .foregroundColor(isLiked ? .red : .gray)
        }
        ).scaleEffect(animate ? animationScale : 1)
        .animation(Animation.easeIn(duration: animationDuration), value: animationDuration)
    }
}

