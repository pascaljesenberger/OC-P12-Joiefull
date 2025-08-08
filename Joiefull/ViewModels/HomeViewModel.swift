//
//  HomeViewModel.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadProducts() {
        isLoading = true
        errorMessage = nil

        ProductService.shared.fetchProducts { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.products = products
                case .failure(_):
                    self.errorMessage = "Une erreur est survenue"
                }
                self.isLoading = false
            }
        }
    }
    
    func products(for category: Category) -> [Product] {
            return products.filter { $0.category == category }
        }
}
