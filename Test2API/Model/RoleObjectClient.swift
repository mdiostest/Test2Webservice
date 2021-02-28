//
//  RoleObjectClient.swift
//  Test2API
//
//  Created by MagicMind Technologies on 28/02/21.
//

import Foundation
class RoleObjectClient : APIClient {
    var session: URLSession
    
    init(configuration : URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    
    func roleFetch( completion : @escaping (Result<CommonResponseModel<[Role]>?, APIError>)->Void)
    {
        let endpoint : Test2APIEndPoints = .role
        fetch(with: endpoint.request, decode: { (json) -> CommonResponseModel<[Role]>? in
            guard let potentialresponse = json as? CommonResponseModel<[Role]> else
            {
                return nil
            }
            
            return potentialresponse
            
        }, completion: completion)
    }
}
