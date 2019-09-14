//
//  NetworkDebugSchema.swift
//  Demo
//
//  Created by 築山朋紀 on 2019/09/15.
//  Copyright © 2019 tomoki_sun. All rights reserved.
//

import Foundation

var networkDebugSchemas: [NetworkDebugSchema] = []

public struct NetworkDebugSchema {
    public var response: HTTPURLResponse?
    public var request: URLRequest
    public var data: Data?
    public var error: Swift.Error?
    
    fileprivate let dateFormatString = "yyyy/MM/dd HH:mm:ss"
    fileprivate let dateFormatter = DateFormatter()
    private let date = Date()
    
    public init(_ response: URLResponse?, request: URLRequest, data: Data?, error: Swift.Error?) {
        self.response = response as? HTTPURLResponse
        self.request = request
        self.data = data
        self.error = error
    }
    
    public var requestBody: String {
        guard let body = request.httpBody, let string = String(data: body, encoding: String.Encoding.utf8) else {
            return "No request body"
        }
        return string
    }
    
    public var responseBody: String {
        guard let data = data, let string = String(data: data, encoding: String.Encoding.utf8) else {
            return "No response body"
        }
        return string
    }
    
    public var url: URL? {
        return request.url
    }
    
    public var dateString: String {
        dateFormatter.dateFormat = dateFormatString
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: date)
    }
}
