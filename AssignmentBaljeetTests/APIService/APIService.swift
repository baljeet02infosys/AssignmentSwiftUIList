//
//  APIService.swift
//  AssignmentBaljeetTests
//
//  Created by Baljeet Kaur on 06/04/22.
//

import XCTest
import Alamofire

class APIService: XCTestCase {
    
    var sut: URLSession!

    override func setUpWithError() throws {
      try super.setUpWithError()
      sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }

    
    // Asynchronous test: success fast, failure slow
    func testValidApiCallGetsHTTPStatusCode200() throws {
        let promise = expectation(description: "Status code: 200")
      // given
      let urlString =
        "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
      let url = URL(string: urlString)!

      let dataTask = sut.dataTask(with: url) { _, response, error in
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
    }

}
