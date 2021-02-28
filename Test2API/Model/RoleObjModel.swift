//
//  RoleObjModel.swift
//  Test2API
//
//  Created by MagicMind Technologies on 28/02/21.
//

import Foundation

// MARK: - Role
struct Role: Codable {
    let id: Int?
    let roleName: String?
    let roleType: Int?
    let company: String?
    let colour, order: String?
    let userID: Int?
    let createdAt: String?
    let updatedAt: UpdatedAt?
    let deletedAt: String?
    let planning: Planning?

    enum CodingKeys: String, CodingKey {
        case id
        case roleName = "role_name"
        case roleType = "role_type"
        case company, colour, order
        case userID = "user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case planning
    }
}

// MARK: - Planning
struct Planning: Codable {
    let id: Int?
    let mission, vision: String?
    let type, clientRoleID: Int?
    let year, quarter, createdAt, updatedAt: String?
    let deletedAt: String?
    let objective: [Objective]?

    enum CodingKeys: String, CodingKey {
        case id, mission, vision, type
        case clientRoleID = "client_role_id"
        case year, quarter
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case objective
    }
}

// MARK: - Objective
struct Objective: Codable {
    let id: Int?
    let contentObj, score: String?
    let projectID: String?
    let planningID: Int?
    let createdAt, updatedAt: String?
    let deletedAt: String?
    let keyResult: [KeyResult]?
    let majorAction: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case contentObj = "content_obj"
        case score
        case projectID = "project_id"
        case planningID = "planning_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case keyResult = "key_result"
        case majorAction = "major_action"
    }
}

// MARK: - KeyResult
struct KeyResult: Codable {
    let id: Int?
    let keyResult: String?
    let metrics: String?
    let objectiveID: Int?
    let createdAt, updatedAt: String?
    let deletedAt: String?
    let type: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case keyResult = "key_result"
        case metrics
        case objectiveID = "objective_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case type
    }
}

enum UpdatedAt: String, Codable {
    case the20210216T131940000000Z = "2021-02-16T13:19:40.000000Z"
}
