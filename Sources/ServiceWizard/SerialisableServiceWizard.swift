//
//  SerialisableServiceWizard.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 20/4/22.
//

import Foundation

public final class SerialisableServiceWizard: ServiceWizardType {
    private var requestBuilder: RequestBuilderType
    
    public init(requestBuilder: RequestBuilderType) {
        self.requestBuilder = requestBuilder
    }
    
    public func request(configuration: ServiceWizardConfigurationType,
                 responseCompletion: @escaping ((Result<[AnyHashable: Any]?, NetworkModuleError>)->Void)) throws {
        let request = try requestBuilder.build(endpoint: configuration.endPoint)
        
        configuration.webService.request(withUrlRequest: request) { data, response, error in
            responseCompletion(ResponseHandler.handleSerialisable(data: data, response: response, error: error))
        }
    }
    
    public func upload(configuration: ServiceWizardConfigurationType,
                responseCompletion: @escaping ((Result<[AnyHashable: Any]?, NetworkModuleError>)->Void)) throws {
        guard let contentData = configuration.contentData else {
            responseCompletion(.failure(NetworkModuleError.uploadDataNotFound))
            return
        }
        
        configuration.webService.upload(withUrlRequest: try requestBuilder.build(endpoint: configuration.endPoint), uploadContent: contentData, responseCompletion: { data, response, error in
            responseCompletion(ResponseHandler.handleSerialisable(data: data, response: response, error: error))
        })
    }
}
