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
    @State private var isActive:Bool = false
    @Orientation var orientation

    var body: some View {
        NavigationView {
            if self.isActive {
                List {
                    if viewModel.menusData.rows.count == 0 {
                        HStack {
                            ProgressView()
                        }
                    } else {
                        ForEach(viewModel.menusData.rows) { section in
                            if !section.title.isEmpty || !section.description.isEmpty {
                                ItemRow(item: section)
                            }
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
                    return Alert(title: Text(AppString.error), message: Text(AppString.noInternet), dismissButton: .default(Text(AppString.ok)))
                }
                PlaceholderView()
            } else {
                Text(AppString.launchScreenText)
            }
        }.frame(maxWidth:MaxWidth)
            .phoneOnlyStackNavigationView()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

