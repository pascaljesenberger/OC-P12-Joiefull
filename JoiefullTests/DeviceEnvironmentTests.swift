//
//  DeviceEnvironmentTests.swift
//  JoiefullTests
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import XCTest
@testable import Joiefull
import SwiftUI

final class DeviceEnvironmentTests: XCTestCase {
    func testUpdateSizeCategory() {
        let env = DeviceEnvironment()
        env.updateSizeCategory(.large)
        XCTAssertEqual(env.sizeCategory, .large)
    }
    
    func testUpdateFromUIKit() {
        let env = DeviceEnvironment()
        env.updateFromUIKit(.extraLarge)
        XCTAssertEqual(env.sizeCategory, .extraLarge)
    }
}
