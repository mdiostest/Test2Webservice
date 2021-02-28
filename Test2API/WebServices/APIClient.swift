//
//  APIClient.swift
//  GH Immigration
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation

protocol APIClient {
    var session: URLSession { get  }
	func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void)
}

extension APIClient  {
	typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    private func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
		
		let task = session.dataTask(with: request) { data, response, error in
			guard let httpResponse = response as? HTTPURLResponse else {
				completion(nil, .requestFailed)
				return
			}
//             let convertedString = String(data: data!, encoding: String.Encoding.utf8) // the data will be converted to the string
//                   print("response in string--\(convertedString ?? "defaultvalue")")
			if httpResponse.statusCode == 200 {
				if let data = data {
                    
					do {
                        do {
                            if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                                // Print out dictionary
                                print("dict--\(convertedJsonIntoDict)")
                            }
                        } catch let error as NSError {
                            print(error.localizedDescription)
                        }
						let decoder = JSONDecoder()
						let genericModel = try decoder.decode(decodingType, from: data)
						completion(genericModel, nil)
					} catch let error {
                        debugPrint("Error--\(error)")
                       
						completion(nil, .jsonConversionFailure)
					}
				} else {
					completion(nil, .invalidData)
				}
			}
            else if httpResponse.statusCode == 401
            {
                completion(nil, .unauthorized)
            }
            else {
                print("status code--\(httpResponse.statusCode)")
				completion(nil, .responseUnsuccessful)
			}
		}
		return task
	}
	
     func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void) {
		let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
			
			//MARK: change to main queue
			DispatchQueue.main.async {
				guard let json = json else {
					if let error = error {
						completion(Result.failure(error))
					} else {
						completion(Result.failure(.invalidData))
					}
					return
				}
				if let value = decode(json) {
					completion(.success(value))
				} else {
					completion(.failure(.jsonParsingFailure))
				}
			}
		}
		task.resume()
	}
}
