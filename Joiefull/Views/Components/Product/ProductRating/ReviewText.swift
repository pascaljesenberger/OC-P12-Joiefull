//
//  ReviewText.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 18/08/2025.
//

import SwiftUI

struct ReviewText: View {
    @Binding var reviewText: String
    var onConfirm: (() -> Void)? = nil
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("Partagez ici votre impression sur cette pièce", text: $reviewText, axis: .vertical)
            .lineLimit(3...10)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
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
                        onConfirm?()
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
    ReviewText(reviewText: $reviewText)
        .frame(height: 100)
        .padding()
}
