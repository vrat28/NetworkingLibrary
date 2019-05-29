//
//  JSONParameterEncoder.swift
//  NetworkingLibrary
//
//  Created by Varun Rathi on 29/05/19.
//  Copyright © 2019 Varun Rathi. All rights reserved.
//

import Foundation

public struct JSONParameterEncoder:ParameterEncoder {

    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        do {
            let jsonData  = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        
        }
        catch {
                throw NetworkError.encodingFailed
        }
    }
}
