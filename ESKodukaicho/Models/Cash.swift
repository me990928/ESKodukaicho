//
//  Cash.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/13.
//

import SwiftData
import Foundation

@Model
final class Cash {
    @Attribute(.unique) var id: String
    var title: String
    var registerDate: Date
    var genre: String
    @Relationship(inverse: \Tags.cash) var tags: [Tags]
    var cash: Double
    var memo: String
    var createdAt: Date
    var updatedAt: Date
    
    init(id: String, title: String, registerDate: Date, genre: String, tags: [Tags] = [], cash: Double, memo: String, createdAt: Date = .now, updatedAt: Date = .now) {
        self.id = id
        self.title = title
        self.registerDate = registerDate
        self.genre = genre
        self.tags = tags
        self.cash = cash
        self.memo = memo
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

