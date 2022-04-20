//
//  ResponseDecoder.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public struct ResponseDecoder: ResponseParserType {
    public init() {}
    
    public func parse<ResponseType: Codable>(data: Data?) -> Result<ResponseType?, NetworkModuleError> {
        guard let data = data else {
            return .failure(.emptyResponse)
        }
        
        let jsonDecoder = JSONDecoder()
        
        do {
            let decodedData = try jsonDecoder.decode(ResponseType.self, from: data)
            
            return .success(decodedData)
        }
        catch {
            return .failure(.parsingError(errorDescription: error.localizedDescription))
        }
    }
}
