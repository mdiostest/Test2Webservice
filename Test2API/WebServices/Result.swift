//
//  Result.swift
//  GH Immigration
//
//  Created by User-81-Mac on 01/10/18.
//  Copyright © 2018 User-81-Mac. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
	case success(T)
	case failure(U)
}
