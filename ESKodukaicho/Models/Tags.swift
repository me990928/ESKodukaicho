//
//  Tags.swift
//  ESKodukaicho
//
//  Created by 広瀬友哉 on 2024/10/13.
//

import SwiftData
import Foundation
import SwiftUI
import UIKit

@Model
final class Tags {
    @Attribute(.unique) var id: String
    var name: String
    var red: Double  = 0
    var green: Double = 0
    var blue: Double = 0
    var alpha: Double = 0
    var createdAt: Date
    var updatedAt: Date
    
    // relationship
    var budget: [Budget]
    var cash: [Cash]
    var save: [Save]
    
    init (id: String, name: String, red: Double, green: Double, blue: Double, alpha: Double, createdAt: Date = .now, updatedAt: Date = .now, budget: [Budget] = [], cash: [Cash] = [], save: [Save] = []) {
        self.id = id
        self.name = name
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.budget = budget
        self.cash = cash
        self.save = save
    }
    
    convenience init(color: Color, name: String) {
        let uiColor = UIColor(color)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let id = UUID().uuidString
        self.init(id: id, name: name, red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
    }
    
    func toColor() -> Color {
        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}
