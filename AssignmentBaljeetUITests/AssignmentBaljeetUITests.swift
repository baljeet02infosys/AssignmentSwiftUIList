//
//  AssignmentBaljeetUITests.swift
//  AssignmentBaljeetUITests
//
//  Created by Baljeet Kaur on 05/04/22.
//

import XCTest
import SwiftUI
import AssignmentBaljeet

class AssignmentBaljeetUITests: XCTestCase {
    
    // MARK: - getMenu
    func testNormalMenuCells() {
        let viewModel = MenuModelView()
        viewModel.menusData = Menu.with()
        guard viewModel.menusData.rows.first != nil else {
            XCTFail()
            return
        }
    }
    func testEmptyMenuCells() {
        let viewModel = MenuModelView()
        viewModel.menusData = Menu.emptyWith()
        guard viewModel.menusData.rows.first != nil else {
            XCTFail()
            return
        }
    }
}
