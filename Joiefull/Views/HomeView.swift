//
//  HomeView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            HangerAnimation()
        } else if let error = viewModel.errorMessage {
            Text(error)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(Category.allCases, id: \.self) { category in
                        let filtered = viewModel.products(for: category)
                        if !filtered.isEmpty {
                            ProductRow(category: category, products: filtered)
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    HomeView()
}
