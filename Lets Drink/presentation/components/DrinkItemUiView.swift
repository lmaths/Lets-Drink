//
//  DrinkItemUiView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

struct DrinkItemUiView: View {
    let title: String
    let imageURL: String
    let description: String
    var body: some View {
        HStack {
            ImageUiView(url: URL(string: imageURL), size: CGSize(width: 80, height: 80))
                    .cornerRadius(8)
                    .padding(.leading, 24)
            VStack(alignment: .leading) {
                   Text(title)
                       .font(.headline)
                       .foregroundColor(.primary)
                       .padding(.leading, 0)
                   Text(description)
                       .font(.subheadline)
                       .foregroundColor(.secondary)
                       .lineLimit(2)
                       .truncationMode(.tail)
                       .padding(.leading, 0)
               }
           
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct DrinkItemUiView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkItemUiView(title: "teste", imageURL: "dqwdqw", description: "qdwdqwd")
    }
}
