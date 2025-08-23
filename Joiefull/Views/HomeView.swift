//
//  HomeView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject private var deviceEnvironment: DeviceEnvironment
    @State private var selectedProduct: Product? = nil
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                HangerAnimation()
                    .accessibilityLabel("Chargement des produits")
                    .accessibilityHint("Veuillez patienter")
                    .accessibilityAddTraits(.updatesFrequently)
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .font(.system(size: deviceEnvironment.fontSize(24), weight: .semibold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Erreur")
                    .accessibilityValue(error)
                    .accessibilityAddTraits([.isStaticText, .playsSound])
            } else {
                GeometryReader { geometry in
                    ZStack(alignment: .trailing) {
                        ScrollView {
                            VStack(alignment: .leading, spacing: deviceEnvironment.imageSize(24)) {
                                ForEach(Category.allCases, id: \.self) { category in
                                    let filtered = viewModel.products(for: category)
                                    if !filtered.isEmpty {
                                        ProductRow(category: category, products: filtered, selectedProduct: $selectedProduct)
                                    }
                                }
                            }
                            .padding(.top)
                        }
                        .accessibilityLabel("Liste des produits par catégorie")
                        .accessibilityHint("Balayez vers le haut ou le bas pour naviguer entre les catégories")
                        
                        if deviceEnvironment.isIpad, let product = selectedProduct {
                            ProductDetailView(product: product)
                                .frame(width: geometry.size.width * (geometry.size.width > geometry.size.height ? 0.4 : 0.54))
                                .background(Color.white)
                                .id(product.id)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(DeviceEnvironment())
}
