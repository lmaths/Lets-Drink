//
//  DrinkViewModel.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 07/06/23.
//

import SwiftUI
import Combine

class DrinkViewModel: ObservableObject {
    @Published var drinks: [Drink] = []
    @Published var isLoading: Bool = false
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchDrinks(categorieId: Int) {
        isLoading = true
        apiClient.performRequest(endpoint: "drinks.json?category=\(categorieId)", method: .get) { [weak self] (result: Result<[Drink], Error>) in
            switch result {
            case .success(let drinks):
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.drinks = drinks
                    print(drinks)
                  
                }
            case .failure(let error):
                print("Erro ao buscar os drinks \(error.localizedDescription)")
            }
        }
    }
}

