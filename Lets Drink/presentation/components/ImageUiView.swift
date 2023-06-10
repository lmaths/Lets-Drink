//
//  ImageUiView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

struct ImageUiView: View {
    let url: URL?
    let size: CGSize?
    
    var body: some View {
        Group {
            if let size = size {
                makeImage(withSize: size)
            } else {
                makeImage()
            }
        }
    }
    
    private func makeImage(withSize size: CGSize = CGSize(width: 120, height: 120)) -> some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                Image(systemName: "xmark.octagon")
                    .foregroundColor(.red)
                    .frame(width: size.width, height: size.height)
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit) // Alterado para .fill
            case .success(let image):
                image
                    .resizable()
                    .frame(width: size.width, height: size.height)
                    .scaledToFit()
                    .cornerRadius(8)
            case .failure:
                Image(systemName: "xmark.octagon")
                    .foregroundColor(.red)
                    .frame(width: size.width, height: size.height)
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit) // Alterado para .fill
            @unknown default:
                fatalError()
            }
        }
    }

}

struct ImageUiView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUiView(url: URL(string: "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg")!, size: CGSize(width: 80, height: 80))
    }
}
