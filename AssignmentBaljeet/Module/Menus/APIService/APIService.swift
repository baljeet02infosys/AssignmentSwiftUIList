//
//  APIService.swift
//  AssignmentBaljeet
//
//  Created by Baljeet Kaur on 06/04/22.
//

import Foundation
import Alamofire

// MARK: - AppServerClient
class AppServerClient {
    // MARK: - GetFeeds
    enum GetFeedsFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
        case noInterNet = 101
    }
   
    typealias GetFeedsResult = Result<Menu, GetFeedsFailureReason>
    typealias GetFeedsCompletion = (_ result: GetFeedsResult) -> Void
    
    /// Get Feeds
    /// - Parameter completion: Completion handler will return response
    /// Success: return with Menu data model
    /// Failure: return with Error message
    func getFeeds(completion: @escaping GetFeedsCompletion) {
        if ((NetworkReachabilityManager()?.isReachable) != nil) {
            AF.request(AppConfig.baseUrl, encoding: URLEncoding.queryString)
                .responseString { response in
                    switch response.result {
                    case .success:
                        guard let string = response.value else {
                            return
                        }
                        do{
                            if let json = string.data(using: String.Encoding.utf8){
                                if (try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:AnyObject]) != nil{
                                    let jsonDecoder = JSONDecoder()
                                    let responseModel = try jsonDecoder.decode(Menu.self, from: json)
                                    completion(.success(payload: responseModel))
                                }
                            }
                        }catch {
                            print(error.localizedDescription)
                            completion(.failure(nil))
                        }
                    case .failure(_):
                        if let statusCode = response.response?.statusCode,
                           let reason = GetFeedsFailureReason(rawValue: statusCode) {
                            completion(.failure(reason))
                        }
                        let reason = GetFeedsFailureReason(rawValue: GetFeedsFailureReason.noInterNet.rawValue)
                        completion(.failure(reason))
                    }
                }
        } else {
            let reason = GetFeedsFailureReason(rawValue: GetFeedsFailureReason.noInterNet.rawValue)
            completion(.failure(reason))
        }
    }
}
