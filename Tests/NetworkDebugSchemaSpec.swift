//
//  NetworkDebugSchemaSpec.swift
//  NetworkDebuggingToolTests
//
//  Created by 築山朋紀 on 2019/09/15.
//  Copyright © 2019 tomoki69386. All rights reserved.
//

import XCTest
import NetworkDebuggingTool

class NetworkDebugSchemaSpec: XCTestCase {
    var schema: NetworkDebugSchema {
        var urlComponents = URLComponents(string: "http://twitter.com/tomoki_sun")!
        urlComponents.queryItems = [URLQueryItem(name: "page", value: "1")]
        let request = URLRequest(url: urlComponents.url!)
        return NetworkDebugSchema(nil, request: request, data: nil, error: nil)
    }
    
    func testRequestURL() {
        let url = URL(string: "http://twitter.com/tomoki_sun?page=1")
        XCTAssertEqual(url, schema.url)
    }
    
    func testRequestURLHost() {
        XCTAssertEqual("twitter.com", schema.url?.host)
    }
    
    func testRequestURLPath() {
        XCTAssertEqual("/tomoki_sun", schema.url?.path)
    }
    
    func testRequestURLQuery() {
        XCTAssertEqual("page=1", schema.url?.query)
    }
    
    func testRequestBody() {
        XCTAssertEqual("No request body", schema.requestBody)
    }
    
    func testResponseBody() {
        XCTAssertEqual("No response body", schema.responseBody)
    }
}
