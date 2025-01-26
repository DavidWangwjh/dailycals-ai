//
//  Image.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import Foundation
import SwiftUICore

struct IdentifiableImage: Identifiable {
    let id = UUID() // Unique identifier
    var image: Image?
}
