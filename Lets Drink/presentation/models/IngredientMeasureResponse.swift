//
//  IngredientMeasureResponse.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 04/07/23.
//

import Foundation
struct IngredientMeasureResponse
: Codable, Identifiable, Equatable {
    let id = UUID()
    let ingredient: Ingredient
    let amount: Float
    let measure: Measure
}
