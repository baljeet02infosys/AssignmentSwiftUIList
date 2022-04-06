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
    @Published var menusData: Menu = Menu(fromDictionary: [:])
    func getMenus() {
        AF.request("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json", encoding: URLEncoding.queryString)
            .responseString{
                response in
                let string = response.value
                do{
                    if let json = string!.data(using: String.Encoding.utf8){
                        if let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:AnyObject]{
                            self.menusData = Menu(fromDictionary: jsonData)
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
    }
    
}
