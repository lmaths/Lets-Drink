//
//  DrinkManager.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 07/06/23.
//

import Foundation
class DrinkManager: ObservableObject {
        @Published var drinks: [Drink] = []
        @Published var isLoading = true
}
