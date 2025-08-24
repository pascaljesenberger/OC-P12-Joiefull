//
//  ProductRating.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 16/08/2025.
//

import SwiftUI

struct ProductRating: View {
    @State private var rating: Int = 0
    @State private var reviewText = ""
    @State private var isSubmitted = false
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 14) {
            if isSubmitted {
                VStack(spacing: 14) {
                    HStack(spacing: 8) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 42))
                            .foregroundColor(Color.blue)
                        
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= rating ? "star.fill" : "star")
                                .font(.system(size: 28))
                                .foregroundColor(index <= rating ? Color.appOrange : .black.opacity(0.5))
                        }
                        Spacer()
                    }
                    
                    Text(reviewText)
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.2), lineWidth: 1)
                        )
                        .background(Color(.systemBackground))
                }
            } else {
                RatingStars(rating: $rating)
                ReviewText(reviewText: $reviewText, onConfirm: {
                    if !reviewText.isEmpty && rating > 0 {
                        isSubmitted = true
                    } else {
                        showAlert = true
                    }
                })
            }
        }
        .padding(.horizontal)
        .alert("Veuillez compléter votre évaluation", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Merci de sélectionner une note et d'écrire un commentaire.")
        }
    }
}

#Preview {
    ProductRating()
        .environmentObject(DeviceEnvironment())
}
