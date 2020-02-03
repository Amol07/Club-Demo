//
//  EndPoints.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Company: Endpoint {
        case fetch
        public var path: String {
            switch self {
            case .fetch: return "api/json/get/Vk-LhK44U"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(EnvironmentURL.baseUrl)\(path)"
            }
        }
    }
}
