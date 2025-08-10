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
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: viewModel.product.picture.url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device),
                               height: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device))
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .accessibilityLabel("Chargement de l'image")
                }
                .cornerRadius(ResponsiveSizes.imageSize(20, for: sizeCategory, device: device))
                .accessibilityElement()
                .accessibilityLabel("Image du produit : \(viewModel.product.picture.description)")
                .accessibilityAddTraits(.isImage)
                .contentShape(Rectangle())
                .frame(width: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device),
                       height: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device))
                .clipped()
                
                LikeItem(
                    likes: viewModel.currentLikes,
                    isLiked: viewModel.isLiked,
                    onToggle: viewModel.toggleLike
                )
                .padding(ResponsiveSizes.fontSize(8, for: sizeCategory, device: device))
            }
            .accessibilityElement(children: .contain)
            .frame(width: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device),
                   height: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device))
            .clipped()

            ProductInfo(product: viewModel.product)
                .accessibilityElement(children: .combine)
        }
        .frame(width: ResponsiveSizes.imageSize(198, for: sizeCategory, device: device))
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    ProductItem(product: .preview)
}
