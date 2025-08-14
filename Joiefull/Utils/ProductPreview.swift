//
//  ProductPreview.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import Foundation

extension Product {
    static var preview: Product {
        Product(
            id: 1,
            picture: Picture(
                url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/2.jpg",
                description: "Exemple de produit"
            ),
            name: "Pendentif bleu pour femme",
            category: .accessories,
            likes: 42,
            price: 19.99,
            original_price: 69.99
        )
    }
}
