//
//  FavoriteUiView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

struct FavoriteUiView: View {
    let drinks: [Drink]
    @Binding var liked: Bool

    var body: some View {
        NavigationView {
            ScrollView {
            VStack(alignment: .leading) {
                ForEach(drinks) { drink in
                    HStack(spacing: 24) {
                        DrinkItemUiView(title: drink.name, imageURL: drink.imageURL)
                        Spacer()
                        HeartButtonUIView(isLiked: $liked).padding(.trailing, 24)
                        
                    }
                    Divider()
                }
            }
            }.navigationTitle("Favoritos")
        }
    
    }
}
