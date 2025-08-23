//
//  ProductService.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import Foundation

class ProductService {
    static let shared = ProductService()
    
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/api/clothes.json") else {
            return completion(.failure(URLError(.badURL)))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(URLError(.badServerResponse)))
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
