//
//  ContentView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

struct Drink: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: URL
}

struct HomeView: View {
    @State private var isFavorite = false
    let drinks = [
        Drink(name: "Cerveja", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyfmo_phepH-dn3JLKehmn8uY2TkQoM_VywyjFW_2kzRSQ_McBtAVnDjmaqQT8eSQiGUc&usqp=CAU")!),
        Drink(name: "Cerveja", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyfmo_phepH-dn3JLKehmn8uY2TkQoM_VywyjFW_2kzRSQ_McBtAVnDjmaqQT8eSQiGUc&usqp=CAU")!),
        Drink(name: "Cerveja", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyfmo_phepH-dn3JLKehmn8uY2TkQoM_VywyjFW_2kzRSQ_McBtAVnDjmaqQT8eSQiGUc&usqp=CAU")!),
        Drink(name: "Cerveja", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyfmo_phepH-dn3JLKehmn8uY2TkQoM_VywyjFW_2kzRSQ_McBtAVnDjmaqQT8eSQiGUc&usqp=CAU")!)
    ]
    
    var body: some View {
        TabView {
            DrinksUiView(drinks: drinks)
                .tabItem {
                Image(systemName: "mappin.circle.fill")
                Text("Drinks")
            }
            
            FavoriteUiView(drinks: drinks, liked: $isFavorite).tabItem {
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
