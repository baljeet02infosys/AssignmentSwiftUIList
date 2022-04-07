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
            Text(AppConfig.welcomeScreenTitle)
                .font(.largeTitle)
            Text(AppConfig.welcomeScreenDescription)
                .foregroundColor(.secondary)
        }
    }
}
