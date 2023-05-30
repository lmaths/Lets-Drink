//
//  DrinksUiView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

let drinksMock = [
    Drink(name: "Cerveja", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyfmo_phepH-dn3JLKehmn8uY2TkQoM_VywyjFW_2kzRSQ_McBtAVnDjmaqQT8eSQiGUc&usqp=CAU")!),
    Drink(name: "Cerveja", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyfmo_phepH-dn3JLKehmn8uY2TkQoM_VywyjFW_2kzRSQ_McBtAVnDjmaqQT8eSQiGUc&usqp=CAU")!),
    Drink(name: "Cerveja", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyfmo_phepH-dn3JLKehmn8uY2TkQoM_VywyjFW_2kzRSQ_McBtAVnDjmaqQT8eSQiGUc&usqp=CAU")!),
    Drink(name: "Cerveja", imageURL: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyfmo_phepH-dn3JLKehmn8uY2TkQoM_VywyjFW_2kzRSQ_McBtAVnDjmaqQT8eSQiGUc&usqp=CAU")!)
]

struct DrinksUiView: View {
    let drinks: [Drink]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lets Drink")
                .font(.title)
                .padding(.leading)
                .padding(.top, 32)
            ForEach(drinks) { drink in
                DrinkItemUiView(title: drink.name, imageURL: drink.imageURL)
                Divider()
            }
        }
    }
}

struct DrinksUiView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksUiView(drinks: drinksMock)
    }
}
