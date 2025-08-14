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
        VStack {
            ProductImageLike(
                product: product,
                currentLikes: viewModel.currentLikes,
                isLiked: viewModel.isLiked,
                toggleLike: viewModel.toggleLike,
                sizeCategory: sizeCategory,
                device: device
            )
            
            ProductInfo(product: product)
            
            Text(product.picture.description)
                .font(.system(size: ResponsiveSizes.fontSize(14, for: sizeCategory, device: device), weight: .semibold))
                .foregroundColor(.black)
        }
    }
}
