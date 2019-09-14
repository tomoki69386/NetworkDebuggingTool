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
        let request = URLRequest(url: URL(string: "https://github.com")!)
        return NetworkDebugSchema(nil, request: request, data: nil, error: nil)
    }
    
    func testRequestURL() {
        var url = URL(string: "https://github.com")
        XCTAssertEqual(url, schema.url)
        
        url = nil
        XCTAssertNotEqual(url, schema.url)
    }
}
