

import Foundation

struct Menu : Codable, Identifiable {
	let title : String
    var rows : [Rows]
    let id: UUID
	enum CodingKeys: String, CodingKey {
        case title = "title"
        case rows = "rows"
	}
    /// Initialize
    /// - Parameter decoder: Initialize model with decoder
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
		rows = try values.decodeIfPresent([Rows].self, forKey: .rows) ?? []
        id = UUID()
	}
    
    /// Menu Model
    /// - Parameter fromDict: JSON data type of [String: Any] to initialize Menu model
    init(fromDict : [String: Any]) {
        title =  AppString.menu
        rows = []
        if let rowItems = fromDict["rows"] as? [[String: Any]] {
            for row in rowItems {
                let rowData = Rows(fromDict: row)
                rows.append(rowData)
            }
        }
        id = UUID()
    }
}
