//
//  HomeViewModelTests.swift
//  JoiefullTests
//
//  Created by Pascal Jesenberger on 24/08/2025.
//

import XCTest
@testable import Joiefull

final class HomeViewModelTests: XCTestCase {
    func testProductsForCategoryFiltersCorrectly() {
        let product1 = Product(
            id: 1,
            picture: Picture(url: "url", description: "desc"),
            name: "Produit1",
            category: .tops,
            likes: 1,
            price: 10,
            original_price: 10
        )
        let product2 = Product(
            id: 2,
            picture: Picture(url: "url", description: "desc"),
            name: "Produit2",
            category: .shoes,
            likes: 2,
            price: 20,
            original_price: 20
        )
        
        let viewModel = HomeViewModel()
        viewModel.products = [product1, product2]
        
        let tops = viewModel.products(for: .tops)
        XCTAssertEqual(tops.count, 1)
        XCTAssertEqual(tops.first?.id, 1)
    }
}
