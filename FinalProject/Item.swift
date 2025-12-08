//
//  Item.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/8/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
