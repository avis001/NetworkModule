//
//  ServiceWizardConfigurationType.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 20/4/22.
//

import Foundation

public protocol ServiceWizardConfigurationType {
    var webService: WebServiceType { get }
    var responseParser: ResponseParserType { get }
    var endPoint: EndpointType { get }
    var contentData: Data? { get }
    var requestQueue: DispatchQueue { get }
}
