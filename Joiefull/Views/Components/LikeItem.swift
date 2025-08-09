//
//  LikeItem.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

struct LikeItem: View {
    let likes: Int
    let isLiked: Bool
    let onToggle: () -> Void
    
    @State private var animate = false
    
    var body: some View {
        Button {
            onToggle()
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                animate = false
            }
        } label: {
            HStack {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.body)
                    .foregroundColor(isLiked ? .red : .primary)
                    .scaleEffect(animate ? 1.4 : 1)
                    .animation(.easeOut(duration: 0.1), value: animate)
                
                Text("\(likes)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(isLiked ? .red : .primary)
                    .monospacedDigit()
                    .contentTransition(.numericText(value: Double(likes)))
                    .transaction { t in
                        t.animation = .default
                    }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(Color.white)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        LikeItem(likes: 42, isLiked: false, onToggle: {})
        LikeItem(likes: 43, isLiked: true, onToggle: {})
    }
    .background(Color.black)
}
