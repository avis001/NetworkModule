//
//  DownloadTaskWebService.swift
//  ReactiveNetworkModule
//
//  Created by Sivasankar on 19/4/22.
//

import Foundation

public class DownloadTaskWebService: WebServiceType {
    public static private(set) var shared: WebServiceType = DownloadTaskWebService()
    
    private lazy var urlSession: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
    
    private init() { }
    
    public func request(withUrlRequest request: URLRequest, responseCompletion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        urlSession.downloadTask(with: request, completionHandler: { url, response, error in
            guard let url = url,
                  let data = try? Data(contentsOf: url) else {
                      responseCompletion(nil, response, error)
                      return
                  }
            
            responseCompletion(data, response, error)
        }).resume()
    }
}
