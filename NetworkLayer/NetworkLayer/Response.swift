//
//  Response.swift
//  NetworkLayer
//
//  Created by Yago Marques on 05/03/24.
//

import Foundation

public enum ResponseStatus: Equatable {
    case finished
    case stoped(reason: String)
}

public struct Response {
    public let code: Int?
    public let data: Data?
    public let status: ResponseStatus
    
    static func stoped(reason: String) -> Self {
        .init(code: nil, data: nil, status: .stoped(reason: reason))
    }
    
    static func finished(code: Int, data: Data) -> Self {
        .init(code: code, data: data, status: .finished)
    }
}


