//
//  ContentView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isFavorite = false
   let drinks = [
    Drink(id: 7,
                       name: "BEBIDA ALCOOLICA LIMAO XOTA",
                       description: "DQWDQWD",
                       image: "DQWFQ",
                       garnish: "FQFQ",
                       category_id: 2)
   ]
    var body: some View {
        TabView {
            CategoryScreen(viewModel: CategoryViewModel(apiClient: ApiClient.shared))
                .tabItem {
                    Image(systemName: "mappin.circle.fill")
                    Text("Categorias")
                }
            
            FavoriteScreen(drinks: drinks, liked: $isFavorite).tabItem {
                Image(systemName: "mappin.circle.fill")
                Text("Favoritos")
            }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
