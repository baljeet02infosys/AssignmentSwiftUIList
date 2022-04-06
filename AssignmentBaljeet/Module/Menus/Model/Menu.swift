

import Foundation

struct Menu : Codable, Identifiable {
	let title : String
    var rows : [Rows]
    let id: UUID
	enum CodingKeys: String, CodingKey {

		case title = "title"
		case rows = "rows"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
		rows = try values.decodeIfPresent([Rows].self, forKey: .rows) ?? []
        id = UUID()
	}
    init(fromDict : [String: Any]) {
        title =  "Menus"
        rows = []
        id = UUID()
    }

}
