

import Foundation
struct Rows : Codable, Identifiable {
    var id: UUID
    var title : String
    var description : String
    var imageHref : String

	enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case imageHref = "imageHref"
	}
    
    /// Initialize
    /// - Parameter decoder: Initialize model with decoder
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
		description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
		imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref) ?? ""
        id = UUID()
	}
    
    /// Row Model
    /// - Parameter fromDict: JSON data type of [String: Any] to initialize Row model
    init(fromDict : [String: Any]) {
        self.title = AppString.menu
        self.imageHref = ""
        self.description = ""
        id = UUID()
        if let name = fromDict[ParameterKeys.title] as? String {
            self.title =  name
        }
        if let name = fromDict[ParameterKeys.imageHref] as? String {
            self.imageHref =  name
        }
        if let name = fromDict[ParameterKeys.description] as? String {
            self.description =  name
        }
    }
}
