//
//  DrinksUiView.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 29/05/23.
//

import SwiftUI

struct DrinkScreen: View {
    @StateObject var viewModel: DrinkViewModel
    @Environment(\.presentationMode) var presentationMode
    var categorieId: Int
    var categorieName: String
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2.0)
            } else {
                ScrollView {
                    VStack() {
                        if(viewModel.isLoading) {
                            HStack(alignment: .bottom) {
                                ProgressView()
                            }
                            
                        } else {
                            ForEach(viewModel.drinks) { drink in
                                DrinkItemUiView(title: drink.name, imageURL: drink.image, description: drink.description)
                                    .onTapGesture {
                                        
                                    }
                                Divider()
                            }
                        }
                    }
                }
                .navigationBarTitle(categorieName)
                .navigationBarBackButtonHidden(false)
            }
        }
        .onAppear {
            viewModel.fetchDrinks(categorieId: categorieId)
        }
    }
}
struct DrinksUiView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DrinkViewModel(apiClient: ApiClient.shared)
        DrinkScreen(viewModel: viewModel, categorieId: 1, categorieName: "dqwd")
    }
}

