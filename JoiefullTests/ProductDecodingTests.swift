//
//  ProductDecodingTests.swift
//  JoiefullTests
//
//  Created by Pascal Jesenberger on 24/08/2025.
//

import XCTest
@testable import Joiefull

final class ProductDecodingTests: XCTestCase {
    func testDecodeProductFromJSON() throws {
        let json = """
        [
            {
                "id": 1,
                "picture": { "url": "test_url", "description": "desc" },
                "name": "Produit Test",
                "category": "TOPS",
                "likes": 5,
                "price": 29.99,
                "original_price": 39.99
            }
        ]
        """.data(using: .utf8)!
        
        let products = try JSONDecoder().decode([Product].self, from: json)
        XCTAssertEqual(products.count, 1)
        XCTAssertEqual(products.first?.name, "Produit Test")
        XCTAssertEqual(products.first?.category, .tops)
    }
}
