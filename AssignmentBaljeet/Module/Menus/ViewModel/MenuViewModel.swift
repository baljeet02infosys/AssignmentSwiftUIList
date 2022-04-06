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
                
               
                
//                response in
//                if let json = response {
//                    if  (json as? [String : AnyObject]) != nil{
//                        if let dictionaryArray = json as? Dictionary<String, AnyObject?> {
//                            let jsonArray = dictionaryArray["value"]
//
//                            if let jsonArray = jsonArray as? Array<Dictionary<String, AnyObject?>>{
//                                for i in 0..<jsonArray.count{
//                                    let json = jsonArray[i]
//                                    if let id = json["id"] as? Int, let jokeString = json["joke"] as? String{
//                                    self.jokes.append(MenuSection(id: id, joke: jokeString))
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
        }
    }
    
}
