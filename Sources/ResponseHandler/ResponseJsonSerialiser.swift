//
//  ResponseJsonSerialiser.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 20/4/22.
//

import Foundation

public struct ResponseJsonSerialiser: ResponseParserType {
    public func parse(data: Data?) -> Result<[AnyHashable: Any]?, NetworkModuleError> {
        guard let data = data else {
            return .failure(.emptyResponse)
        }
        
        do {
            guard let jsonData = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) as? [AnyHashable: Any] else {
                return .failure(.parsingError(errorDescription: "Json Format Broken"))
            }
            
            return .success(jsonData)
        }
        catch {
            return .failure(.parsingError(errorDescription: error.localizedDescription))
        }

    }
}
