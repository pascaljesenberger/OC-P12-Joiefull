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
                url: "https://images.unsplash.com/photo-1593032465171-c9dc71f8a13f", // image publique
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
