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
        let host: String? = "twitter.com"
        XCTAssertEqual(host, schema.url?.host)
    }
    
    func testRequestURLPath() {
        let path: String? = "/tomoki_sun"
        XCTAssertEqual(path, schema.url?.path)
    }
    
    func testRequestURLQuery() {
        let query = "page=1"
        XCTAssertEqual(query, schema.url?.query)
    }
}
