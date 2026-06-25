//
//  MissionView.swift
//  testUrban
//
//  Created by Guillaume Richard on 23/06/2026.
//

import MapKit
import SwiftUI

struct MissionView: View {
    @State var discovery = [Oeuvre]()
    @State var missionTotal = 0
    @State var oeuvres = MockData.arrOfOeuvres
    @State private var selectedOeuvre: Oeuvre?
    var dispo : [Oeuvre] {
        oeuvres.filter{!$0.isDiscovered }
    }
    var body: some View {
        VStack(){
            !discovery.isEmpty ? Text("Il vous reste \(discovery.count) / \(missionTotal) oeuvres à découvrir") : Text(
                ""
            )
            ForEach(discovery) { oeuvre in
                Button {
                    selectedOeuvre = oeuvre
                } label: {
                    CardMission(oeuvre: oeuvre)
                }
            }
        }
        .sheet(item: $selectedOeuvre) { oeuvre in
                VStack {
                    DetailsView(
                        oeuvre: oeuvre,
                        position: .camera(
                            MapCamera(
                                centerCoordinate: oeuvre.location,
                                distance: 1000,
                            )
                        )
                    )
                    .presentationDetents([.large])
                    
                    Button {
                        delete(for: oeuvre.id)
                        selectedOeuvre = nil
                    } label: {
                        Text("Découverte")
                            .foregroundStyle(.mainText)
                            .padding()
                            .background(.secondOrange, in: .capsule)
                        
                }
            }

        }

        if dispo.isEmpty {
            Text("Il n'y plus de mission à mener jeune padawan.")

        } else if discovery.isEmpty {
            Button {
                generateRandomElement()
            } label: {
                Text("Démarrer une nouvelle mission")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .background(.secondOrange, in: .capsule)
            }
        }

        
        
        
        
    }

    func generateRandomElement() {
        discovery = Array(dispo.shuffled().prefix(3))
        missionTotal = discovery.count
        
    }
    
    func delete(for id: UUID) {
        if let index = oeuvres.firstIndex(where: {$0.id == id}) {
            oeuvres[index].isDiscovered.toggle()
        }
        if let index2 = discovery.firstIndex(where: {$0.id == id}) {
            discovery.remove(at: index2)
        }
    }

}

#Preview {
    MissionView()
}
