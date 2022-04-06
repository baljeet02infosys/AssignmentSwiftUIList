//
//  ContentView.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 05/04/22.
//

import SwiftUI

//struct ContentView: View {
//    @ObservedObject var viewModel = MenuModelView()
//
//    var body: some View {
//            NavigationView{
//                List(viewModel.menusData.items) { i in
//                    HStack{Text(i.title)}
//                    }
//                .navigationBarTitle("SwiftUI Alamofire")
//            }.onAppear {
//                viewModel.getMenus()
//            }
//        }
//}
//
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MenuModelView()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.menusData.rows) { section in
                    ItemRow(item: section)
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
struct ItemRow : View {
    let item: Row
    var body: some View {
        HStack {

                NetworkImage(url: URL(string: item.imageHref))
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 25)).clipShape(Circle()).scaledToFill()
                
            VStack(alignment: .leading) {
                Text(item.title).bold()
                Text("\(item.descriptionField)")
            }
            
        }
    }
}
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Row(fromDictionary: [:]))
    }
}
