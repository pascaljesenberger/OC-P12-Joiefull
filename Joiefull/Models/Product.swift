//
//  Product.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import Foundation

struct Product: Identifiable, Decodable {
    let id: Int
    let picture: Picture
    let name: String
    let category: Category
    let likes: Int
    let price: Double
    let original_price: Double
}

struct Picture: Decodable {
    let url: String
    let description: String
}

enum Category: String, Decodable, CaseIterable {
    case accessories = "ACCESSORIES"
    case bottoms = "BOTTOMS"
    case shoes = "SHOES"
    case tops = "TOPS"
}
