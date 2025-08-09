//
//  ProductItem.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct ProductItem: View {
    @StateObject private var viewModel: ProductViewModel
    
    init(product: Product) {
        self._viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: viewModel.product.picture.url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .frame(height: 198)
                .frame(maxWidth: 198)
                .clipped()
                .cornerRadius(20)
                
                LikeItem(
                    likes: viewModel.currentLikes,
                    isLiked: viewModel.isLiked,
                    onToggle: viewModel.toggleLike
                )
                .padding(8)
            }
            
            ProductInfo(product: viewModel.product)
        }
        .frame(width: 198)
    }
}

#Preview {
    ProductItem(product: .preview)
}
