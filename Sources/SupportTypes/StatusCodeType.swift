//
//  StatusCodeType.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public typealias StatusCodeType = ClosedRange<Int>

extension StatusCodeType {
    public static var success = 200 ... 299
    public static var redirection = 300 ... 399
    public static var clientError = 400 ... 499
    public static var serverError = 500 ... 511
}
