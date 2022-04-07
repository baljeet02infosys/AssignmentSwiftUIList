//
//  Constants.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 06/04/22.
//

import Foundation


/// AppConfig
/// It store all common constants for Application
struct AppConfig {
   static var baseUrl: String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            print("Could not find BaseURL variable in info.plist")
            return "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        }
        return value
     }
    static let welcomeScreenTitle = "Welcome to Infosys!"
    static let welcomeScreenDescription = "Please select a feed from the left-hand menu; swipe from the left edge to show it."
}

/// ParameterKeys
///  Common constants keys
struct ParameterKeys {
    static let title = "title"
    static let description = "description"
    static let rows = "rows"
    static let imageHref = "imageHref"
}
/// MARK:
/// Size Constants
let imageSize = 60.0
let imageRadius = 25.0
let MaxWidth = 715.0
