//
//  test.swift
//  testUrban
//
//  Created by Guillaume Richard on 22/06/2026.
//

import MapKit
import SwiftUI

struct HomeView: View {
    let oeuvre = ViewModel.mockData
    @State private var selectedTheme = selection.list
    @State private var showAction = false
    private enum selection: String, CaseIterable {
        case list = "Liste"
        case map = "Carte"
    }
    @State var selectedType = OeuvreType.tous

    var body: some View {
        NavigationStack {
            VStack {
                switch selectedTheme {
                case .list:
                    ListView(selectedType: $selectedType)
                case .map:
                    MapView(
                        position: .camera(
                            MapCamera(
                                centerCoordinate: oeuvre.location,
                                distance: 2000,
                            )
                        )
                    )

                }
            }
            .toolbar {
                ToolbarItem {
                    Picker("Picker", selection: $selectedTheme) {
                        ForEach(selection.allCases, id: \.self) {
                            Text($0.rawValue)
                                .foregroundStyle(.red)
                        }

                    }
                    .pickerStyle(.segmented)
                }

                ToolbarSpacer()

                ToolbarItem {
                    Button {
                        showAction.toggle()
                    } label: {
                        Image(
                            systemName: "line.3.horizontal.decrease.circle"
                        )
                        .font(.title3)
                        .foregroundStyle(.primary)
                    }
                    .actionSheet(isPresented: $showAction) {
                        ActionSheet(
                            title: Text("Liste des filtres"),
                            message: Text("Choisissez un type d'art"),
                            buttons: [
                                .default(
                                    Text("Tous"),
                                    action: {
                                        selectedType = .tous
                                    }
                                ),
                                .default(
                                    Text("Invaders"),
                                    action: {
                                        selectedType = .invaders
                                    }
                                ),

                                .default(
                                    Text("Mural"),
                                    action: {
                                        selectedType = .mural

                                    }
                                ),
                                .default(
                                    Text("Mosaïques"),
                                    action: {
                                        selectedType = .mosaique

                                    }
                                ),
                                .default(
                                    Text("Stencil"),
                                    action: {
                                        selectedType = .stencil

                                    }
                                ),
                                .default(
                                    Text("Calligraphie"),
                                    action: {
                                        selectedType = .calligraphie

                                    }
                                ),

                            ]
                        )
                    }
                }
            }
            .toolbarColorScheme(.light, for: .navigationBar)
        }

    }

}

#Preview {
    HomeView()
}
