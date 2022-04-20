//
//  UploadTaskWebService.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public class UploadTaskWebService: WebServiceType {
    public static private(set) var shared: WebServiceType = UploadTaskWebService()
    
    private lazy var urlSession: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
    
    private init() { }
    
    public func upload(withUrlRequest request: URLRequest, uploadContent: Data, responseCompletion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        urlSession.uploadTask(with: request, from: uploadContent, completionHandler: responseCompletion)
            .resume()
    }
}
