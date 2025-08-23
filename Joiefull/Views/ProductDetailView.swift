//
//  ProductDetailView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 12/08/2025.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    @StateObject private var viewModel: ProductViewModel
    
    init(product: Product, selectedProduct: Binding<Product?> = .constant(nil)) {
        self.product = product
        _viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                ProductItem(
                    product: product,
                    isDetailView: true
                )
                
                ProductRating()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProductDetailView(product: .preview)
        .environmentObject(DeviceEnvironment())
}
