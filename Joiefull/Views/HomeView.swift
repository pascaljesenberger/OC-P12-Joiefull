//
//  HomeView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    
    var body: some View {
        if viewModel.isLoading {
            HangerAnimation()
                .accessibilityLabel("Chargement des produits")
                .accessibilityHint("Veuillez patienter")
        } else if let error = viewModel.errorMessage {
            Text(error)
                .font(.system(size: ResponsiveSizes.fontSize(24, for: sizeCategory, device: device), weight: .semibold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
                .accessibilityLabel("Erreur: \(error)")
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: ResponsiveSizes.imageSize(24, for: sizeCategory, device: device)) {
                    ForEach(Category.allCases, id: \.self) { category in
                        let filtered = viewModel.products(for: category)
                        if !filtered.isEmpty {
                            ProductRow(category: category, products: filtered)
                        }
                    }
                }
                .padding(.top)
            }
            .accessibilityLabel("Liste des produits par catégorie")
        }
    }
}

#Preview {
    HomeView()
}
