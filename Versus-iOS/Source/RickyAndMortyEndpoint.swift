//
//  RickyAndMortyEndpoint.swift
//  Versus-iOS
//
//  Created by Yago Marques on 05/03/24.
//

import Foundation
import NetworkLayer

enum RickAndMortyEndpoint: Endpoint {
    case character
    case location
    case episode
    
    var baseUrl: String {
        "https://rickandmortyapi.com"
    }
    
    var path: String {
        switch self {
        case .character:
            "/api/character"
        case .location:
            "/api/location"
        case .episode:
            "/api/episode"
        }
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var queries: [String : String] {
        [:]
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var body: Data? {
        nil
    }
}
