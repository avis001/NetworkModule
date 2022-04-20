//
//  DataTaskWebService.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public class DataTaskWebService: WebServiceType {
    public static private(set) var shared: WebServiceType = DataTaskWebService()
    
    private lazy var urlSession: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
    
    private init() { }
    
    public func request(withUrlRequest request: URLRequest, responseCompletion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        urlSession.dataTask(with: request, completionHandler: responseCompletion)
            .resume()
    }
}
