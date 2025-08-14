//
//  ProductItem.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct ProductItem: View {
    @StateObject private var viewModel: ProductViewModel
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    
    init(product: Product) {
        self._viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: ResponsiveSizes.fontSize(8, for: sizeCategory, device: device)) {
            ProductImageLike(
                product: viewModel.product,
                currentLikes: viewModel.currentLikes,
                isLiked: viewModel.isLiked,
                toggleLike: viewModel.toggleLike,
                sizeCategory: sizeCategory,
                device: device,
                imageSize: 198
            )
            
            ProductInfo(product: viewModel.product, showDescription: false)
                .accessibilityElement(children: .combine)
        }
        .frame(width: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device))
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    ProductItem(product: .preview)
}
