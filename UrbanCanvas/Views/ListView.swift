//
//  ListView.swift
//  testUrban
//
//  Created by Guillaume Richard on 22/06/2026.
//

import MapKit
import SwiftUI

struct ListView: View {
    @Binding var selectedType: OeuvreType
    @State private var showAction = false

    var filtered: [Oeuvre] {
        MockData.filter(by: selectedType)
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Liste des Street Arts")
                    .font(.largeTitle)
                    .padding(.bottom, -15)
                    .padding(.horizontal)
                    .bold()

                if filtered.count > 0 {
                    List {
                        ForEach(filtered) { oeuvre in
                            NavigationLink(value: oeuvre) {
                                ListItem(oeuvre: oeuvre)
                            }
                        }
                        .alignmentGuide(.listRowSeparatorLeading) { _ in
                            return 0 }
                    }
                    .navigationDestination(for: Oeuvre.self) { oeuvre in
                        DetailsView(
                            oeuvre: oeuvre,
                            position: .camera(
                                MapCamera(
                                    centerCoordinate: oeuvre.location,
                                    distance: 2000,
                                )
                            )
                        )
                    }
                } else {
                    Color.bg
//                    ContentUnavailableView(
//                        "Rien à vous pour le moment",
//                        systemImage: "person.fill"
//                    )
//                    ContentUnavailableView(
//                        "",
//                        systemImage: "person.fill",
//                        description: Text("Rien à voir pour le moment")
//                    )
                }
                
            }
            .background(.bg)

        }
    }
}

#Preview {
    ListView(selectedType: .constant(.tous))
}
