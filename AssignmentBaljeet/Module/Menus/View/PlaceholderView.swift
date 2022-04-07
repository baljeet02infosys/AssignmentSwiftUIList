//
//  PlaceholderView.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 07/04/22.
//

import Foundation
import SwiftUI
struct PlaceholderView: View {
    var body: some View {
        VStack {
            Text("Welcome to Infosys!")
                .font(.largeTitle)
            Text("Please select a feed from the left-hand menu; swipe from the left edge to show it.")
                .foregroundColor(.secondary)
        }
    }
}
