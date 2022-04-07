//
//  ContentView.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 05/04/22.
//


import SwiftUI
import SwiftUIRefresh
import Combine



struct ContentView: View {
    @ObservedObject var viewModel = MenuModelView()
    @State private var isShowing = false
    @Orientation var orientation

    
    var body: some View {
        NavigationView {
            List {
                if viewModel.menusData.rows.count == 0 {
                    HStack {
                        Text("No Feeds!").padding()
                    }
                } else {
                    ForEach(viewModel.menusData.rows) { section in
                        ItemRow(item: section)
                    }
                }
            }.pullToRefresh(isShowing: $isShowing) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isShowing = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        viewModel.getMenus()
                    }
                }
            }
            .navigationTitle(viewModel.menusData.title)
            .listStyle(.insetGrouped)
            .onAppear {
                viewModel.getMenus()
            }.alert(isPresented: $viewModel.hasError) {
                return Alert(title: Text("Error"), message: Text("No internet!" ), dismissButton: .default(Text("OK")))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

