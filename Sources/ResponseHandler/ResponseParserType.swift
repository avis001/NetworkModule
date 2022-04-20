//
//  ResponseParserType.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 20/4/22.
//

import Foundation

public protocol ResponseParserType {
    /// Decodable
    func parse<ResponseType: Codable>(data: Data?) -> Result<ResponseType?, NetworkModuleError>
    
    /// Serialisable
    func parse(data: Data?) -> Result<[AnyHashable: Any]?, NetworkModuleError>
}

public extension ResponseParserType {
    func parse<ResponseType: Codable>(data: Data?) -> Result<ResponseType?, NetworkModuleError> {
        fatalError("To be implemented by the confirmer, or you are using an incorrect service.")
    }
    
    func parse(data: Data?) -> Result<[AnyHashable: Any]?, NetworkModuleError> {
        fatalError("To be implemented by the confirmer, or you are using an incorrect service.")
    }
}
