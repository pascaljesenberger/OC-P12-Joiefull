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
                ProductList(
                    viewModel: viewModel,
                    selectedProduct: $selectedProduct
                )
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(DeviceEnvironment())
}
