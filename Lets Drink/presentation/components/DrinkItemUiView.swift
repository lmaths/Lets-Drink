//
//  DrinkItemUiView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

struct DrinkItemUiView: View {
    let title: String
    let imageURL: URL
    var body: some View {
        HStack(spacing: 16) {
            ImageUiView(url: imageURL, size: CGSize(width: 80, height: 80))
            Text(title)
                .font(.headline)
                .padding(.horizontal)
        }
    }
}

struct DrinkItemUiView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkItemUiView(title: "teste", imageURL: URL(string: "teste")!)
    }
}
