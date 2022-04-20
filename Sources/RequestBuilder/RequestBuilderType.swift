//
//  RequestBuilderType.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public protocol RequestBuilderType {
    var baseUrl: String? { get set }
    func build(endpoint: EndpointType) throws -> URLRequest
}

public extension RequestBuilderType {
    func build(endpoint: EndpointType) throws -> URLRequest {
        guard let baseUrlString = baseUrl,
              let baseUrl = URL(string: baseUrlString),
              let urlString = endpoint.urlString,
              let url = URL(string: urlString, relativeTo: baseUrl) else {
            throw NetworkModuleError.invalidUrl(endpointUrl: endpoint.urlString, baseUrl: baseUrl)
        }
        
        var request = URLRequest(url: url, cachePolicy: endpoint.cachePolicy, timeoutInterval: endpoint.requestTimeOutInterval)
        request.httpMethod = endpoint.httpMethod.rawValue
        
        return request
    }
}

