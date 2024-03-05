//
//  EndpointProtocol.swift
//  NetworkLayer
//
//  Created by Yago Marques on 05/03/24.
//

import Foundation

public enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

public protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queries: [String: String] { get }
    var headers: [String: String] { get }
    var body: Data? { get }
}

extension Endpoint {
    private func queries() -> [URLQueryItem] {
        queries.map { .init(name: $0.key, value: $0.value) }
    }
    
    private func url() -> URL? {
        var components = URLComponents(string: baseUrl)
        components?.path = path
        components?.queryItems = queries()
        
        return components?.url
    }
    
    func request() -> URLRequest? {
        guard let url = url() else { return nil }
        var request = URLRequest(url: url)
        request.httpBody = body
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "ContentType")
        
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return request
    }
}
