//
//  DeviceEnvironment.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 22/08/2025.
//

import SwiftUI

class DeviceEnvironment: ObservableObject {
    let device = UIDevice.current
    @Published var sizeCategory: ContentSizeCategory = .medium
    var isIpad: Bool {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    
    func updateSizeCategory(_ category: ContentSizeCategory = .medium) {
        sizeCategory = category
    }
    
    func updateFromUIKit(_ uiCategory: UIContentSizeCategory) {
        sizeCategory = ContentSizeCategory(uiCategory) ?? .medium
    }
}

extension DeviceEnvironment {
    func imageSize(_ base: CGFloat) -> CGFloat {
        ResponsiveSizes.imageSize(base, for: sizeCategory, device: device)
    }
    
    func fontSize(_ base: CGFloat) -> CGFloat {
        ResponsiveSizes.fontSize(base, for: sizeCategory, device: device)
    }
    
    func productImageSize(isDetailView: Bool) -> CGFloat {
        imageSize(isDetailView ? 360 : 198)
    }
}
