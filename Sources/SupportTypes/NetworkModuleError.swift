//
//  NetworkModuleError.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public enum NetworkModuleError: Error, Equatable {
    case emptyResponse
    case responseTypeNotCodable
    case uploadDataNotFound
    case unexpectedResponse(response: URLResponse?)
    case parsingError(errorDescription: String?)
    case invalidUrl(endpointUrl: String?, baseUrl: String?)
    case clientError(message: String?, response: URLResponse?)
    case serverError(message: String?, response: URLResponse?)
}
