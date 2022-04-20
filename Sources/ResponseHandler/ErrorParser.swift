//
//  ErrorParser.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

struct ErrorParser {
    static func error(forStatusCode statusCode: Int, response: URLResponse?, error: Error?) -> NetworkModuleError {
        if StatusCodeType.clientError.contains(statusCode) {
            return NetworkModuleError.clientError(message: error?.localizedDescription, response: response)
        }
                
        return NetworkModuleError.serverError(message: error?.localizedDescription, response: response)
    }
}
