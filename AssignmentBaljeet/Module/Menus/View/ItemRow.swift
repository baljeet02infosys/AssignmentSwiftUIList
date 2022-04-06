//
//  ItemRow.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 06/04/22.
//

import Foundation
import SwiftUI

struct ItemRow : View {
    let item: Row
    var body: some View {
        HStack {
            NetworkImage(url: URL(string: item.imageHref))
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .clipShape(Circle())
                .scaledToFit()
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
