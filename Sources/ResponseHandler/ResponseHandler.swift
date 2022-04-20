//
//  ResponseHandler.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

struct ResponseHandler {
    static func handleDecodable<ResponseType: Codable>(data: Data?,
                                              response: URLResponse?, error: Error?) -> Result<ResponseType?, NetworkModuleError> {
        guard let httpUrlResponse = response as? HTTPURLResponse else {
            return .failure(NetworkModuleError.unexpectedResponse(response: response))
        }
        
        guard StatusCodeType.success.contains(httpUrlResponse.statusCode) else {
            return .failure(ErrorParser.error(forStatusCode: httpUrlResponse.statusCode, response: response, error: error))
        }
        
        return ResponseDecoder().parse(data: data)
    }
    
    static func handleSerialisable(data: Data?,
                                   response: URLResponse?, error: Error?) -> Result<[AnyHashable: Any]?, NetworkModuleError> {
        guard let httpUrlResponse = response as? HTTPURLResponse else {
            return .failure(NetworkModuleError.unexpectedResponse(response: response))
        }
        
        guard StatusCodeType.success.contains(httpUrlResponse.statusCode) else {
            return .failure(ErrorParser.error(forStatusCode: httpUrlResponse.statusCode, response: response, error: error))
        }
        
        return ResponseJsonSerialiser().parse(data: data)
    }
}
