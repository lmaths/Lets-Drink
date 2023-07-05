//
//  Ingredient.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 04/07/23.
//

import Foundation
struct Ingredient: Codable, Identifiable, Equatable {
        let id: Int
        let name: String
        let description: String?
        let image: String?
}
