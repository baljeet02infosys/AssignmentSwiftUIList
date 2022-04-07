//
//  ItemRow.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 06/04/22.
//

import Foundation
import SwiftUI


/// Cell View for Menu List
struct ItemRow : View {
    let item: Rows
    var body: some View {
        HStack(alignment: .top) {
            NetworkImage(url: URL(string: item.imageHref))
                .frame(width: imageSize, height: imageSize)
                .clipShape(RoundedRectangle(cornerRadius: imageRadius))
                .clipShape(Circle())
                .scaledToFit()
                
            VStack(alignment: .leading) {
                if !item.title.isEmpty {
                    Text(item.title).bold()
                }
                if !item.description.isEmpty {
                    Text("\(item.description)")
                }
            }
        }
    }
}
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Rows(fromDict: [:]))
    }
}
