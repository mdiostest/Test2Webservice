//
//  CommonResponseModel.swift
//  Test2API
//
//  Created by MagicMind Technologies on 28/02/21.
//

import Foundation
// MARK: - CommonResponseModel
struct CommonResponseModel<T: Codable>: Codable {
    let status: Bool?
    let message: String?
    let code: Int?
    let data: T?
}
