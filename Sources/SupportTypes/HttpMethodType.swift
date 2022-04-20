//
//  HttpMethodType.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public enum HttpMethodType: String, Hashable, CaseIterable {
    case get
    case head
    case post
    case put
    case delete
    case connect
    case options
    case trace
    case patch
}
