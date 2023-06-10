//
//  CategoryUiView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 07/06/23.
//

import SwiftUI

struct CategoryUiView: View {
    let title: String
    var body: some View {
        VStack(alignment: .leading) { // Alinhamento do texto à esquerda
                  Text(title)
                .font(.title3)
                      .fontWeight(.regular)
                      .foregroundColor(.primary)
                      .multilineTextAlignment(.leading) // Alinhamento à esquerda
              }
              .padding()
              .frame(maxWidth: .infinity)
              .background(Color.white)
              .cornerRadius(10)
              .overlay(
                  RoundedRectangle(cornerRadius: 10)
                      .stroke(Color.gray, lineWidth: 1)
              )
              .shadow(radius: 1, y: 1)
}
}

struct CategoryUiView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryUiView(title: "String")
    }
}
