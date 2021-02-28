//
//  APIError.swift
//  GH Immigration
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation


enum APIError: Error {
	case requestFailed
	case jsonConversionFailure
	case invalidData
	case responseUnsuccessful
	case jsonParsingFailure
    case unauthorized
	var localizedDescription: String {
		switch self {
		case .requestFailed: return "Request Failed"
		case .invalidData: return "Invalid Data"
		case .responseUnsuccessful: return "Response Unsuccessful"
		case .jsonParsingFailure: return "JSON Parsing Failure"
		case .jsonConversionFailure: return "JSON Conversion Failure"
        case .unauthorized: return "Authentication Failed"
		}
	}
}
