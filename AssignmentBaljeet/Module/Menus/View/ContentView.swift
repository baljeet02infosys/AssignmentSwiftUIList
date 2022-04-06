//
//  ContentView.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 05/04/22.
//


import SwiftUI
import SwiftUIRefresh



struct ContentView: View {
    @ObservedObject var viewModel = MenuModelView()
    @State private var isShowing = false
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.menusData.rows) { section in
                    ItemRow(item: section)
                }
            }.pullToRefresh(isShowing: $isShowing) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isShowing = false
                    viewModel.getMenus()
                }
            }
            .navigationTitle(viewModel.menusData.title)
            .listStyle(.insetGrouped)
            .onAppear {
                viewModel.getMenus()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

