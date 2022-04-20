//
//  ServiceWizardType.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

typealias ServiceWizardType = ServiceWizardTypeExternal & ServiceWizardTypeExternal

protocol ServiceWizardTypeInternal {
    var requestBuilder: RequestBuilderType { get set }
}

public protocol ServiceWizardTypeExternal {
    // MARK: - Decodable support
    
    func request<ResponseType: Codable>(configuration: ServiceWizardConfigurationType,
                                        responseType: ResponseType.Type,
                                        responseCompletion: @escaping ((Result<ResponseType?, NetworkModuleError>)->Void)) throws
    func upload<ResponseType: Codable>(configuration: ServiceWizardConfigurationType,
                                       responseType: ResponseType.Type,
                                       responseCompletion: @escaping ((Result<ResponseType?, NetworkModuleError>)->Void)) throws
    
    // MARK: - Serialisable support

    func request(configuration: ServiceWizardConfigurationType,
                 responseCompletion: @escaping ((Result<[AnyHashable: Any]?, NetworkModuleError>)->Void)) throws
    func upload(configuration: ServiceWizardConfigurationType,
                                       responseCompletion: @escaping ((Result<[AnyHashable: Any]?, NetworkModuleError>)->Void)) throws
}

public extension ServiceWizardTypeExternal {
    func request<ResponseType: Codable>(configuration: ServiceWizardConfigurationType,
                                        responseType: ResponseType.Type,
                                        responseCompletion: @escaping ((Result<ResponseType?, NetworkModuleError>)->Void)) throws {
        fatalError("To be implemented by the confirmer, or you are using an incorrect service.")
    }
    
    func upload<ResponseType: Codable>(configuration: ServiceWizardConfigurationType,
                                       responseType: ResponseType.Type,
                                       responseCompletion: @escaping ((Result<ResponseType?, NetworkModuleError>)->Void)) throws {
        fatalError("To be implemented by the confirmer, or you are using an incorrect service.")
    }
    
    // MARK: - Serialisable support

    func request(configuration: ServiceWizardConfigurationType,
                 responseCompletion: @escaping ((Result<[AnyHashable: Any]?, NetworkModuleError>)->Void)) throws {
        fatalError("To be implemented by the confirmer, or you are using an incorrect service.")
    }
    
    func upload(configuration: ServiceWizardConfigurationType,
                                       responseCompletion: @escaping ((Result<[AnyHashable: Any]?, NetworkModuleError>)->Void)) throws {
        fatalError("To be implemented by the confirmer, or you are using an incorrect service.")
    }
}
