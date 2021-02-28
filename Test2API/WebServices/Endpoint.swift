//
//  Endpoint.swift
//  GH Immigration
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

enum HTTPMethod : String {
	case get = "GET"
	case post = "POST"
	case delete = "DELETE"
	case put = "PUT"
}

protocol Endpoint {
	var base: BaseURLs { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var parameters: JSON? {get}
    var getParameters: String? {get}
}
extension Endpoint {
	var urlComponents: URLComponents {
		var components = URLComponents(string: base.rawValue)!
		components.path = path
        components.query = getParameters
		return components
	}
	
	var request: URLRequest {
        print("requestUrl: \(String(describing: urlComponents.url))")
        let request = NSURLRequest(url:urlComponents.url!, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData , timeoutInterval: 60)
        URLCache.shared.removeCachedResponse(for: request as URLRequest)
        
		var tempRequest = URLRequest(url: urlComponents.url!)
		tempRequest.httpMethod = method.rawValue
        
		tempRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        tempRequest.setValue("Bearer 1035|BTCwOpC02h0EpKJrLRCf9qNoRa8SFnieZtmZ58fN", forHTTPHeaderField: "Authorization")
        
//        if let accessToken = UserDefaults.standard.value(forKey: "authToken")
//        {
//            tempRequest.setValue("\(accessToken)", forHTTPHeaderField: "Authorization")
//        }
        
        if let appVersion = UserDefaults.standard.value(forKey: "appVersion")
               {
                   tempRequest.setValue("\(appVersion)", forHTTPHeaderField: "App-Version")
               }
        
        
		if let params = parameters {
			if let data = try? JSONSerialization.data(withJSONObject: params, options:JSONSerialization.WritingOptions.prettyPrinted) {
				tempRequest.httpBody = data
			} else {
				// JSON Serialization error
				tempRequest.httpBody = nil
			}
		} else {
			// no parameters
		}
		return tempRequest
	}
}
