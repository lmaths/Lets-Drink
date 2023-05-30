//
//  BottomNavigationUIView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

struct BottomNavigationUIView: View {
    var body: some View {
        TabView {
            Text("Favourites Screen")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourites")
                }
            Text("Friends Screen")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Friends")
            }
            Text("Nearby Screen")
                .tabItem {
                    Image(systemName: "mappin.circle.fill")
                    Text("Nearby")
            }
        }
    }
}

struct BottomNavigationUIView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationUIView()
    }
}
