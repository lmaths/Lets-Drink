//
//  DrinkDetailsScreen.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 09/06/23.
//

import SwiftUI

struct DrinkDetailsScreen: View {
    let drinkId: Int
    
    @StateObject private var viewModel: DrinkDetailsViewModel = DrinkDetailsViewModel(apiClient: ApiClient.shared)
    @Environment(\.presentationMode) var presentationMode
    @State private var showAnimation = true
    
    var body: some View {
        ZStack {
            if showAnimation {
                HStack(alignment: .bottom) {
                    LottieView(isLoading: viewModel.isLoading, animationName: "ic_loading", startFrame: 100, endFrame: 350, loadingTitle: "Carregando detalhes", animationCompletionHandler: {
                        showAnimation = false
                    })
                }
            } else {
                ScrollView {
                    if let details = viewModel.drinkDetails {
                        VStack(alignment: .leading, spacing: 16) {
                            Group {
                                if let image = details.image {
                                    ImageUiView(url: URL(string: image), size: CGSize(width: 80, height: 80))
                                        .cornerRadius(8)
                                        .padding(.leading, 24)
                                }
                                
                                
                                Text(details.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                if let description = details.description {
                                    Text(description)
                                        .font(.body)
                                        .foregroundColor(.secondary)
                                    
                                }
                                
                                Divider()
                                
                                Text("Ingredientes")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            
                            
                            ForEach(details.ingredients) { ingredientMeasure in
                                HStack(spacing: 16) {
                                    if let image = ingredientMeasure.ingredient.image {
                                        ImageUiView(url: URL(string: image), size: CGSize(width: 80, height: 80))
                                            .cornerRadius(8)
                                            .padding(.leading, 24)
                                    }
                                    
                                    Text(ingredientMeasure.ingredient.name)
                                        .font(.body)
                                    
                                    Spacer()
                                }
                            }
                            
                            Divider()
                            
                            Text("Modo de Preparo")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text(details.prepare_mode)
                                .font(.body)
                            Divider()
                            Text("Guarnição")
                                .font(.title2)
                                .fontWeight(.bold)
                            if let garnish = details.garnish {
                                Text(garnish)
                                    .font(.body)
                            }
                          
                            Spacer()
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            viewModel.getDetails(drinkId: drinkId)
        }
    }
}

struct DrinkDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetailsScreen(drinkId: 1)
    }
}
