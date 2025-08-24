//
//  ProductViewModelTests.swift
//  JoiefullTests
//
//  Created by Pascal Jesenberger on 24/08/2025.
//

import XCTest
@testable import Joiefull

final class ProductViewModelTests: XCTestCase {
    func testToggleLikeIncrementsAndDecrements() {
        let product = Product(
            id: 1,
            picture: Picture(url: "url", description: "desc"),
            name: "Produit",
            category: .tops,
            likes: 0,
            price: 10,
            original_price: 10
        )
        let viewModel = ProductViewModel(product: product)
        
        viewModel.toggleLike()
        XCTAssertTrue(viewModel.isLiked)
        XCTAssertEqual(viewModel.currentLikes, 1)
        
        viewModel.toggleLike()
        XCTAssertFalse(viewModel.isLiked)
        XCTAssertEqual(viewModel.currentLikes, 0)
    }
}
