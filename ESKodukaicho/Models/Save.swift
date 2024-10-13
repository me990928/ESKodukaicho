//
//  Save.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/13.
//
import SwiftData
import Foundation

@Model
final class Save {
    @Attribute(.unique) var id: String
    @Relationship(inverse: \Tags.save) var tags: [Tags]
    var save: Double
    var createdAt: Date
    var updatedAt: Date
    
    init(id: String, tags: [Tags] = [], save: Double, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.tags = tags
        self.save = save
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
