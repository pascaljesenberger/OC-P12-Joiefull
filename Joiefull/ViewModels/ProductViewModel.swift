//
//  ProductViewModel.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 08/08/2025.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var product: Product
    @Published var currentLikes: Int
    @Published var isLiked: Bool
    
    init(product: Product) {
        self.product = product
        self.currentLikes = product.likes
        self.isLiked = product.isLiked
    }
    
    func toggleLike() {
        isLiked.toggle()
        
        if isLiked {
            currentLikes += 1
        } else {
            currentLikes -= 1
        }
    }
}
