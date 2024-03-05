//
//  NetworkLayer.swift
//  NetworkLayer
//
//  Created by Yago Marques on 04/03/24.
//

import Foundation

public protocol HTTPClient {
    func executeHTTP(endpoint: Endpoint) async throws -> Response
}

final public class Network: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .init(configuration: .default)) {
        self.session = session
    }
    
    public func executeHTTP(endpoint: Endpoint) async throws -> Response {
        Log.analyze(endpoint)
        
        guard let request = endpoint.request() else {
            Log.message("error to build request", .failure)
            return .stoped(reason: "error to build request")
        }
        
        Log.request(request)
            
        let (data, response) = try await session.data(for: request)
        
        Log.message("endpoint called", .success)
        Log.data(data)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            Log.message("invalid response", .failure)
            return .stoped(reason: "invalid response")
        }
        
        Log.response(httpResponse)
        
        return .finished(code: httpResponse.statusCode, data: data)
    }
}
