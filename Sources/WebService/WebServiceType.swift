//
//  WebServiceType.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public protocol WebServiceType: AnyObject {
    static var shared: WebServiceType { get }
    func request(withUrlRequest request: URLRequest, responseCompletion: @escaping ((Data?, URLResponse?, Error?) -> Void))
    func upload(withUrlRequest request: URLRequest, uploadContent: Data, responseCompletion: @escaping ((Data?, URLResponse?, Error?) -> Void))
}

public extension WebServiceType {
    func request(withUrlRequest request: URLRequest, responseCompletion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        fatalError("To be implemented by the confirmer, or you are using a incorrect service.")
    }
    
    func upload(withUrlRequest request: URLRequest, uploadContent: Data, responseCompletion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        fatalError("To be implemented by the confirmer, or you are using a incorrect service.")
    }
}

public enum WebServiceFacade {
    public static var dataService: WebServiceType {
        DataTaskWebService.shared
    }
    
    public static var downloadService: WebServiceType {
        DownloadTaskWebService.shared
    }
    
    public static var uploadService: WebServiceType {
        UploadTaskWebService.shared
    }
}
