//
//  Budget.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/13.
//
import Foundation
import SwiftData

@Model
final class Budget {
    @Attribute(.unique) var id: String
    @Relationship(inverse: \Tags.budget) var tags: [Tags]
    var budget: Double
    var createdAt: Date
    var updatedAt: Date
    
    init(id: String, tags: [Tags] = [], budget: Double, createdAt: Date = .now, updatedAt: Date = .now) {
        self.id = id
        self.tags = tags
        self.budget = budget
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}


