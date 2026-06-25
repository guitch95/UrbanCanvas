//
//  MapView.swift
//  testUrban
//
//  Created by Guillaume Richard on 22/06/2026.
//

import MapKit
import SwiftUI

struct MapView: View {
    let oeuvres = MockData.arrOfOeuvres
    @State var position: MapCameraPosition
    @State private var selectedOeuvre: Oeuvre?
    @State private var showSheet = false
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            Map(position: $position, selection: $selectedOeuvre) {
                ForEach(oeuvres) { oeuvre in
                    Marker("", coordinate: oeuvre.location).tag(oeuvre)
                }

            }
//            .toolbar(.hidden)
            .tint(.secondOrange)
            .navigationDestination(for: Oeuvre.self) { oeuvre in
                DetailsView(
                    oeuvre: oeuvre,
                    position: .camera(
                        MapCamera(
                            centerCoordinate: oeuvre.location,
                            distance: 1000,
                        )
                    )
                )
            }

        }
        .sheet(item: $selectedOeuvre) { oeuvre1 in
            InfoSheet(oeuvre: oeuvre1) { oeuvre2 in
                selectedOeuvre = nil
                path.append(oeuvre2)
            }
            .presentationDetents([.medium])
        }

    }
}

#Preview {
    let oeuvre = MockData.mockData

    MapView(
        position: .camera(
            MapCamera(
                centerCoordinate: oeuvre.location,
                distance: 1000,
            )
        )
    )
}
