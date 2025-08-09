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
    
    var body: some View {
        
        Button(action: onToggle) {
            HStack {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.body)
                    .foregroundColor(isLiked ? .red : .primary)
                
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
    VStack {
        LikeItem(likes: 42, isLiked: false, onToggle: {})
        LikeItem(likes: 43, isLiked: true, onToggle: {})
    }
    .background(Color.black)
}
