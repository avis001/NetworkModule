//
//  DecodableServiceWizard.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public final class DecodableServiceWizard: ServiceWizardType {
    private var requestBuilder: RequestBuilderType
    
    public init(requestBuilder: RequestBuilderType) {
        self.requestBuilder = requestBuilder
    }
    
    public func request<ResponseType: Codable>(configuration: ServiceWizardConfigurationType,
                                               responseType: ResponseType.Type,
                                               responseCompletion: @escaping ((Result<ResponseType?, NetworkModuleError>)->Void)) throws {
        let request = try requestBuilder.build(endpoint: configuration.endPoint)
        
        configuration.webService.request(withUrlRequest: request) { data, response, error in
            responseCompletion(ResponseHandler.handleDecodable(data: data, response: response, error: error))
        }
    }
    
    public func upload<ResponseType: Codable>(configuration: ServiceWizardConfigurationType,
                                              responseType: ResponseType.Type,
                                              responseCompletion: @escaping ((Result<ResponseType?, NetworkModuleError>)->Void)) throws {
        guard let contentData = configuration.contentData else {
            responseCompletion(.failure(NetworkModuleError.uploadDataNotFound))
            return
        }
        
        configuration.webService.upload(withUrlRequest: try requestBuilder.build(endpoint: configuration.endPoint), uploadContent: contentData, responseCompletion: { data, response, error in
            responseCompletion(ResponseHandler.handleDecodable(data: data, response: response, error: error))
        })
    }
}
