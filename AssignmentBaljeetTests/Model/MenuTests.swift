//
//  MenuTests.swift
//  AssignmentBaljeetTests
//
//  Created by Baljeet Kaur on 06/04/22.
//

import XCTest

class MenuTests: XCTestCase {

    func testSuccessfulInit() {
        let row = [
            "title":"Beavers",
            "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
            "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
            ]
        let rows = [row]
        let testSuccessfulJSON = ["title": "About Canada",
                                    "rows": rows] as [String : Any]

        XCTAssertNotNil(Menu(json: testSuccessfulJSON))
    }
}


// Mark: - extension Menu
private extension Menu {
    init?(json: [String: Any]) {
        guard
            let title = json["title"] as? String,
            let rows = json["rows"] as? [[String: Any]] else {
                return nil
        }
        self.title = title
        self.rows = []
        self.id = UUID()
        
        for  row in rows {
            if let item = Rows(json: row) {
                self.rows.append(item)
            }
        }
    }
}
// Mark: - extension Row
private extension Rows {
    init?(json: [String: Any]) {
        guard
            let title = json["title"] as? String,
            let description = json["description"] as? String,
            let imageHref = json["imageHref"] as? String else {
                return nil
        }
        self.id = UUID()
        self.title = title
        self.description = description
        self.imageHref = imageHref
    }
}
