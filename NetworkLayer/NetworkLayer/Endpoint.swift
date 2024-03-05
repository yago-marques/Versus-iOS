//
//  EndpointProtocol.swift
//  NetworkLayer
//
//  Created by Yago Marques on 05/03/24.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

protocol Endpoint {
    var baseUrl: String { get set }
    var path: String { get set }
    var method: HTTPMethod { get set }
    var queries: [String: String] { get set }
    var headers: [String: String] { get set }
    var body: Data? { get set }
}

extension Endpoint {
    private func queries() -> [URLQueryItem] {
        queries.map { .init(name: $0.key, value: $0.value) }
    }
    
    private func url() -> URL? {
        var components = URLComponents(string: baseUrl)
        components?.path = path
        components?.scheme = "https"
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
