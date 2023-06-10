//
//  CategoryScreen.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 07/06/23.
//

import SwiftUI

struct CategoryScreen: View {
    @StateObject var viewModel: CategoryViewModel
    var body: some View {
        NavigationView {
            List(viewModel.categories) { categorie in
                NavigationLink(destination: DrinkScreen(viewModel: DrinkViewModel(apiClient: ApiClient.shared), categorieId: categorie.id, categorieName: categorie.name)) {
                    Text(categorie.name)
            }
            }
            .navigationBarTitle("Categorias")
           
             
    }.onAppear {
        viewModel.getCategories()
        }
    }
}

struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen(viewModel: CategoryViewModel(apiClient: ApiClient.shared))
    }
}
