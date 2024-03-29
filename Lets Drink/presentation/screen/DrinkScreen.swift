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
    @State private var showAnimation = true
    
    var body: some View {
        ZStack {
            if showAnimation {
                HStack(alignment: .bottom) {
                    LottieView(isLoading: viewModel.isLoading, animationName: "ic_loading", startFrame: 100, endFrame: 350, loadingTitle: "Estamos buscando pelos drinks...", animationCompletionHandler: {
                        showAnimation = false
                    })
                }
            } else {
                ScrollView {
                    VStack() {
                        ForEach(viewModel.drinks) { drink in
                            NavigationLink(destination: DrinkDetailsScreen(drinkId: drink.id)) {
                                DrinkItemUiView(title: drink.name, imageURL: drink.image, description: drink.description)
                            }
                            Divider()
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

