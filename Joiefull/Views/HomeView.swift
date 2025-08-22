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
                ScrollView {
                    VStack(alignment: .leading, spacing: deviceEnvironment.imageSize(24)) {
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
                .accessibilityHint("Balayez vers le haut ou le bas pour naviguer entre les catégories")
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(DeviceEnvironment())
}
