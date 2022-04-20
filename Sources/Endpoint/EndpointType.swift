//
//  EndpointType.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public protocol EndpointType {
    var urlString: String? { get set }
    var httpMethod: HttpMethodType { get set }
    var parameters: [String: String] { get set }
    var requestParameterLocation: RequestParameterLocation { get set }
    var cachePolicy: URLRequest.CachePolicy { get }
    var requestTimeOutInterval: TimeInterval { get }
}

public extension EndpointType {
    var cachePolicy: URLRequest.CachePolicy {
        .useProtocolCachePolicy
    }
    
    var requestTimeOutInterval: TimeInterval {
        60
    }
}
