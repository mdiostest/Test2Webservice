//
//  APIEndpoints.swift
//  GH Immigration
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation

enum Test2APIEndPoints {

    case role
}

enum BaseURLs : String {
    
    case baseURL = "http://planningpro.dedicateddevelopers.us"
    
}

extension Test2APIEndPoints: Endpoint {
    var parameters: JSON? {
        switch self {
 
        case .role:
            return nil
        }
    }
    
    var getParameters: String? {
        switch self {

        case .role:
            return nil

        }
    }
    
    var base: BaseURLs {
        
        switch self {

        case .role:
            return .baseURL

        }
    }
    
    
    
    var path: String {
        
   
        let folder : String = "/api/role/"
        
        switch self {
  
        case .role:
            return folder + "planning/0"
        }
    }
    
    var method: HTTPMethod {
        switch self {
  
        case .role:
            return .get

        }
    }
}
