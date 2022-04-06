//
//  MockMenu.swift
//  AssignmentBaljeetTests
//
//  Created by Baljeet Kaur on 06/04/22.
//

import Foundation

extension Menu {
    static func with() -> Menu{
        let row = [
            "title":"Beavers",
            "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
            "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
            ]
        let rows = [row]
        let json = ["title": "About Canada",
                                    "rows": rows] as [String : Any]
        return  Menu(fromDict: json)
    
    }
    static func emptyWith() -> Menu{
        let row:[String: Any] = [:]
        let rows = [row]
        let json = ["title": "About Canada",
                                    "rows": rows] as [String : Any]
        return  Menu(fromDict: json)
    
    }
    
}
