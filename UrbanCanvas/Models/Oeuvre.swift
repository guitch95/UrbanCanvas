//
//  Oeuvres.swift
//  testUrban
//
//  Created by Guillaume Richard on 22/06/2026.
//

import Foundation
import MapKit
import SwiftUI

struct Oeuvre: Identifiable, Hashable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    let type: OeuvreType
    let condition: String
    let date: String
    let author: String
    let city: String
    let address: String
    let latitude: Double
    let longitude: Double
    let photo: ImageResource
    var isDiscovered: Bool
    
    
    var location : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

enum OeuvreType: String, Decodable, CaseIterable, Identifiable {
    case tous = "Tous"
    case invaders = "Invaders"
    case mosaique = "Mosaïques"
    case mural = "Mural"
    case stencil = "Stencil"
    case calligraphie = "Calligraphie"

    var id : OeuvreType { self }

}

