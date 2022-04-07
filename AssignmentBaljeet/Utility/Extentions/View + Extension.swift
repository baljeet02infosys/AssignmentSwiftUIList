//
//  View + Extension.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 07/04/22.
//

import Foundation
import SwiftUI


extension View {
    
    /// phoneOnlyStackNavigationView
    /// - Returns: View
    /// Handle UI When App is in landscape mode
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}
