//
//  ContentView.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 05/04/22.
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MenuModelView()
    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                List {
                    ForEach(viewModel.menusData.rows) { section in
                        ItemRow(item: section)
                    }
                }.refreshable {
                    viewModel.getMenus()
                }
                .navigationTitle(viewModel.menusData.title)
                .listStyle(.insetGrouped)
                .onAppear {
                    viewModel.getMenus()
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
