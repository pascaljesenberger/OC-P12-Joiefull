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
    let showDescription: Bool
    let imageSize: CGFloat?
    let isNavigationEnabled: Bool
    
    init(product: Product, showDescription: Bool = true, imageSize: CGFloat? = 198, isNavigationEnabled: Bool = true) {
        self._viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
        self.showDescription = showDescription
        self.imageSize = imageSize
        self.isNavigationEnabled = isNavigationEnabled
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
                imageSize: imageSize,
                isNavigationEnabled: isNavigationEnabled
            )
            
            ProductInfo(product: viewModel.product, showDescription: showDescription)
                .accessibilityElement(children: .combine)
        }
        .frame(width: imageSize != nil ? ResponsiveSizes.imageSize(imageSize!, for: sizeCategory, device: device) : nil)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    VStack(spacing: 20) {
        ProductItem(product: .preview, showDescription: true, imageSize: nil, isNavigationEnabled: false)
        ProductItem(product: .preview, showDescription: false, imageSize: 198, isNavigationEnabled: true)
    }
}
