//
//  ShareButton.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 14/08/2025.
//

import SwiftUI

struct ShareButton: View {
    let product: Product
    @Environment(\.sizeCategory) private var sizeCategory
    private let device = UIDevice.current
    
    var body: some View {
        ShareLink(item: URL(string: product.picture.url)!) {
            Image("share")
                .resizable()
                .scaledToFit()
                .frame(width: ResponsiveSizes.imageSize(18, for: sizeCategory, device: device))
                .padding(10)
                .background(Color.white)
                .clipShape(Circle())
                .contentShape(Circle())
        }
    }
}

#Preview {
    ShareButton(product: .preview)
}
