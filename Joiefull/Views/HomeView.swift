//
//  ContentView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.products) { product in
                        Text(product.name)
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }
}

#Preview {
    HomeView()
}
