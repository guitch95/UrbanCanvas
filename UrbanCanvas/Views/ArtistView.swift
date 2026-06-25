//
//  AuteursView.swift
//  testUrban
//
//  Created by Guillaume Richard on 22/06/2026.
//

import SwiftUI

struct ArtistView: View {
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    let artist = MockData.arrOfArtist
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(artist) { artist in
                    ArtistTab(artist: artist)
                }
            }
            .padding()
        }
        .background(.bg)
    }
}

#Preview {
    ArtistView()
}
