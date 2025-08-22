//
//  ReviewTextView.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 18/08/2025.
//

import SwiftUI

struct ReviewTextView: View {
    @Binding var reviewText: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("Partagez ici votre impression sur cette pièce", text: $reviewText, axis: .vertical)
            .lineLimit(3...10)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.2), lineWidth: 1)
            )
            .focused($isFocused)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Confirmer") {
                        isFocused = false
                    }
                    .padding(2.6)
                    .background(Capsule().fill(Color.appOrange))
                    .foregroundColor(.white)
                }
            }
    }
}

#Preview {
    @Previewable @State var reviewText = ""
    ReviewTextView(reviewText: $reviewText)
        .frame(height: 100)
        .padding()
}
