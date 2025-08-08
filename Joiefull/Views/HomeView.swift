//
//  ContentView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var didLoad = false
    
    var body: some View {
        if viewModel.isLoading {
            HangerAnimation()
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(Category.allCases, id: \.self) { category in
                        let filtered = viewModel.products.filter { $0.category == category }
                        if !filtered.isEmpty {
                            ProductRow(category: category, products: filtered)
                        }
                    }
                }
                .padding(.top)
            }
            .onAppear {
                if !didLoad {
                    viewModel.loadProducts()
                    didLoad = true
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
