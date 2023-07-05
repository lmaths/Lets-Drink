//
//  DrinkDetailsViewModel.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 19/06/23.
//

import Foundation
class DrinkDetailsViewModel: ObservableObject {
    
    
    @Published var drinkDetails: DrinkDetailsResponse? = nil
    @Published var isLoading: Bool = false
    
    let apiClient: ApiClient
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getDetails(drinkId: Int) {
        isLoading = true
        apiClient.performRequest(endpoint: "drinks/\(drinkId).json", method: .get) { [weak self] (result: Result<DrinkDetailsResponse, Error>) in switch result {
            
        case .success(let drinkDetails):
            DispatchQueue.main.async {
                self?.isLoading = false
                self?.drinkDetails = drinkDetails
                print(drinkDetails)
            }
        case .failure(let error):
            debugPrint(error)
            print("Erro ao buscar as categorias \(error.localizedDescription)")
        }
            
        }
        
    }
}
