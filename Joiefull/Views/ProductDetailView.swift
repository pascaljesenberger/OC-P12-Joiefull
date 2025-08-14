//
//  ProductDetailView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 12/08/2025.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    private let device = UIDevice.current
    @StateObject private var viewModel: ProductViewModel
    @Environment(\.sizeCategory) private var sizeCategory
    
    init(product: Product) {
        self.product = product
        _viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ProductImageLike(
                    product: product,
                    currentLikes: viewModel.currentLikes,
                    isLiked: viewModel.isLiked,
                    toggleLike: viewModel.toggleLike,
                    sizeCategory: sizeCategory,
                    device: device,
                    imageSize: nil,
                    isNavigationEnabled: false
                )
                
                ProductInfo(product: product, showDescription: true)
            }
        }
        .padding(.horizontal)
    }
}
