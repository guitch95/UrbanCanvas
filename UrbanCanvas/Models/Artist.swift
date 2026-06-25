//
//  Artist.swift
//  testUrban
//
//  Created by Guillaume Richard on 24/06/2026.
//

import Foundation
import SwiftUI

struct Artist: Identifiable {
    var id = UUID()
    var name: String
    var age: String
    var origines: String
    var style: String
    var image: ImageResource?
}

