//
//  HangerAnimation.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 08/08/2025.
//

import SwiftUI

struct HangerAnimation: View {
    @State private var angle: Double = -20
    
    var body: some View {
        VStack {
            Image("hanger")
                .resizable()
                .scaledToFit()
                .frame(width: 140)
                .rotationEffect(.degrees(angle), anchor: .top)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true),
                    value: angle
                )
                .onAppear {
                    angle = 20
                }
        }
    }
}

#Preview {
    HangerAnimation()
}
