//
//  ProductList.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 23/08/2025.
//

import SwiftUI

struct ProductList: View {
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    @ObservedObject var viewModel: HomeViewModel
    @Binding var selectedProduct: Product?
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            let detailViewWidth = isLandscape ?
                geometry.size.width * 0.4 :
                min(geometry.size.width * 0.8, 440)
            
            ZStack(alignment: .trailing) {
                ScrollView {
                    VStack(alignment: .leading, spacing: deviceEnvironment.imageSize(24)) {
                        ForEach(Category.allCases, id: \.self) { category in
                            let filtered = viewModel.products(for: category)
                            if !filtered.isEmpty {
                                ProductRow(
                                    category: category,
                                    products: filtered,
                                    selectedProduct: $selectedProduct,
                                    detailViewWidth: deviceEnvironment.isIpad && selectedProduct != nil ? detailViewWidth : 0
                                )
                            }
                        }
                    }
                    .padding(.top)
                    .padding(.trailing, deviceEnvironment.isIpad && selectedProduct != nil ? detailViewWidth : 0)
                }
                .accessibilityLabel("Liste des produits par catégorie")
                .accessibilityHint("Balayez vers le haut ou le bas pour naviguer entre les catégories")
                
                if deviceEnvironment.isIpad, let product = selectedProduct {
                    ProductDetailView(product: product)
                        .frame(width: detailViewWidth)
                        .background(Color.white)
                        .id(product.id)
                }
            }
        }
    }
}

#Preview {
    ProductList(
        viewModel: HomeViewModel(),
        selectedProduct: .constant(nil)
    )
    .environmentObject(DeviceEnvironment())
}
