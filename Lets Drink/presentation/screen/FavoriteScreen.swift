//
//  FavoriteUiView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

struct FavoriteScreen: View {
    let drinks: [Drink]
    @Binding var liked: Bool

    var body: some View {
        NavigationView {
            ScrollView {
            VStack(alignment: .leading) {
                ForEach(drinks) { drink in
                    HStack(spacing: 24) {
                        DrinkItemUiView(title: drink.name, imageURL: drink.image, description: drink.description)
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
