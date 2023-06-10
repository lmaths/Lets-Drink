//
//  CategoryViewModel.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 07/06/23.
//

import Foundation
class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var isLoading: Bool = false
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getCategories() {
        isLoading = true
        apiClient.performRequest(endpoint: "categories.json", method: .get) { [weak self] (result: Result<[Category], Error>) in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.categories = categories
                    print(categories)
                }
            case .failure(let error):
                print("Erro ao buscar as categorias \(error.localizedDescription)")
            }
        }
    }
}
