//
//  Drink.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 07/06/23.
//

import Foundation
struct Drink: Codable, Identifiable, Equatable {
        let id: Int
        let name: String
        let description: String
        let image: String
        let garnish: String
        let category_id: Int
        let created_at: String
        let updated_at: String
        let url: String
}
