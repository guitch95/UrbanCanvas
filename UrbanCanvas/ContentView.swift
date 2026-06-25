//
//  ContentView.swift
//  UrbanCanvas
//
//  Created by Guillaume Richard on 25/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab {
            } label: {
                Image(systemName: "photo.artframe.circle")
                    .environment(\.symbolVariants, .none)
                Text("Oeuvres")
            }
            Tab {
                ArtistView()
            } label: {
                Image(systemName: "person.circle")
                    .environment(\.symbolVariants, .none)
                Text("Auteurs")
            }
            
            Tab {
            } label: {
                Image(systemName: "gamecontroller.fill")
                    .environment(\.symbolVariants, .none)
                Text("Missions")
            }
        }
        .tint(.mainOrange)
        
    }
}

#Preview {
    ContentView()
}
