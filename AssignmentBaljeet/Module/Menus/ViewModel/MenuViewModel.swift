//
//  MenuViewModel.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 05/04/22.
//

import Foundation
import SwiftUI
import Alamofire

class MenuModelView: ObservableObject {
    @Published var menusData: Menu = Menu(fromDict: [:])
    @Published var services = AppServerClient()
    func getMenus() {
        services.getFeeds { result in
            print(result)
            switch result {
            case .success(let menu):
                self.menusData = menu
            case .failure(_): break
            }
        }
        
        //
        //        AF.request("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json", encoding: URLEncoding.queryString)
        //            .responseString{
        //                response in
        //                guard let string = response.value else {
        //                    return
        //                }
        //                do{
        //                    if let json = string.data(using: String.Encoding.utf8){
        //                        if let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:AnyObject]{
        //                            self.menusData = Menu(fromDictionary: jsonData)
        //                        }
        //                    }
        //                }catch {
        //                    print(error.localizedDescription)
        //                }
        //            }
    }
    
}
