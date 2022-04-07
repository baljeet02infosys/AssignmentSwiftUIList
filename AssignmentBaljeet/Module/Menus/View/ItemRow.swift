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
        HStack {
            NetworkImage(url: URL(string: item.imageHref))
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .clipShape(Circle())
                .scaledToFit()
            VStack(alignment: .leading) {
                Text(item.title).bold()
                Text("\(item.description)")
            }
        }
    }
}
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Rows(fromDict: [:]))
    }
}
