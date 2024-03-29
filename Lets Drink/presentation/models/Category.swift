//
//  Category.swift
//  Lets Drink
//
//  Created by Matheus Lima da Silva on 07/06/23.
//

import Foundation
struct Category: Codable, Identifiable, Equatable {
        let id: Int
        let name: String
        let description: String?
}
