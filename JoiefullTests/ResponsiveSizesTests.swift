//
//  ResponsiveSizesTests.swift
//  JoiefullTests
//
//  Created by Pascal Jesenberger on 24/08/2025.
//

import XCTest
@testable import Joiefull
import SwiftUI

final class ResponsiveSizesTests: XCTestCase {
    func testImageSizeIphone() {
        let size = ResponsiveSizes.imageSize(100, for: .medium, device: UIDevice.current)
        XCTAssertGreaterThan(size, 0)
    }
    
    func testFontSizeIpad() {
        let device = UIDevice.current
        let size = ResponsiveSizes.fontSize(20, for: .large, device: device)
        XCTAssertGreaterThan(size, 0)
    }
}
