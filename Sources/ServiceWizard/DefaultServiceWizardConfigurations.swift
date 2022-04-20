//
//  DefaultServiceWizardConfigurations.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 20/4/22.
//

import Foundation

public struct DataServiceConfiguration: ServiceWizardConfigurationType {
    public var webService: WebServiceType
    public var responseParser: ResponseParserType
    public var endPoint: EndpointType
    public var contentData: Data?
    public var requestQueue: DispatchQueue
    
    public init(webService: WebServiceType = WebServiceFacade.dataService,
                  responseParser: ResponseParserType = ResponseDecoder(),
                  endPoint: EndpointType,
                  contentData: Data? = nil,
                  requestQueue: DispatchQueue = DispatchQueue.main) {
        self.webService = webService
        self.responseParser = responseParser
        self.endPoint = endPoint
        self.contentData = contentData
        self.requestQueue = requestQueue
    }
}

public struct DownloadServiceConfiguration: ServiceWizardConfigurationType {
    public var webService: WebServiceType
    public var responseParser: ResponseParserType
    public var endPoint: EndpointType
    public var contentData: Data?
    public var requestQueue: DispatchQueue
    
    public init(webService: WebServiceType = WebServiceFacade.downloadService,
                  responseParser: ResponseParserType = ResponseDecoder(),
                  endPoint: EndpointType,
                  contentData: Data? = nil,
                  requestQueue: DispatchQueue = DispatchQueue.main) {
        self.webService = webService
        self.responseParser = responseParser
        self.endPoint = endPoint
        self.contentData = contentData
        self.requestQueue = requestQueue
    }
}

public struct UploadServiceConfiguration: ServiceWizardConfigurationType {
    public var webService: WebServiceType
    public var responseParser: ResponseParserType
    public var endPoint: EndpointType
    public var contentData: Data?
    public var requestQueue: DispatchQueue
    
    public init(webService: WebServiceType = WebServiceFacade.uploadService,
                  responseParser: ResponseParserType = ResponseDecoder(),
                  endPoint: EndpointType,
                  contentData: Data? = nil,
                  requestQueue: DispatchQueue = DispatchQueue.main) {
        self.webService = webService
        self.responseParser = responseParser
        self.endPoint = endPoint
        self.contentData = contentData
        self.requestQueue = requestQueue
    }
}
