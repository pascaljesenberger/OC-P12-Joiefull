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
        print("Fetching products...")
        
        guard let url = URL(string: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/api/clothes.json") else {
            print("Invalid URL")
            return completion(.failure(URLError(.badURL)))
        }
        
        print("URL: \(url)")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Server responded")
            
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                return completion(.failure(error))
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP status: \(httpResponse.statusCode)")
            }
            
            guard let data = data else {
                print("No data received")
                return completion(.failure(URLError(.badServerResponse)))
            }
            
            print("Data size: \(data.count) bytes")
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                print("Decoded \(products.count) products")
                completion(.success(products))
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }
}
