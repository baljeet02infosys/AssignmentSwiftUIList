//
//  MenuViewModel.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 05/04/22.
//

import Foundation
import SwiftUI
import Alamofire


/// MenuModelView
///  MenuModelView is responsible for managing business login for Menu Module 
class MenuModelView: ObservableObject {
    @Published var menusData: Menu = Menu(fromDict: [:])
    @Published var services = AppServerClient()
    @Published var hasError: Bool = false
    
    /// getMenus
    /// Fetching Feeds from server
    /// GET call type of String Encoding
    func getMenus() {
        services.getFeeds { result in
            print(result)
            switch result {
            case .success(let menu):
                self.menusData = menu
            case .failure(_):
                self.hasError = true
            }
        }
    }
    
}
