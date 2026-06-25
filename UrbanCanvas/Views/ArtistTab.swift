//
//  ArtistTab.swift
//  testUrban
//
//  Created by Guillaume Richard on 24/06/2026.
//

import SwiftUI

struct ArtistTab: View {
    let artist: Artist
    var body: some View {
        VStack(spacing: 10) {
            if let image = artist.image {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65, alignment: .center)
                    .clipShape(.circle)

            } else {
                Circle()
                    .fill(.gray.opacity(0.1))
                    .frame(height: 65)
                    .overlay {
                        Image(systemName: "person.slash.fill")
                            .font(.largeTitle)
                    }

            }

            Text(artist.name)
                .foregroundStyle(.mainOrange)
                .bold()

            VStack {
                Text("\(Text("Age").bold()): \(artist.age)")
                Text("\(Text("Origines").bold()): \(artist.origines)")
                Text("\(Text("Style").bold()): \(artist.style)")
            }
            .font(.caption)
            .padding(.bottom, 10)

            Button {
                print("Hello")
            } label: {
                Text("Site web")
                    .foregroundStyle(.white)
                    .font(.caption)
                    .bold()
                    .padding(8)
                    .frame(width: 150)
                    .background(.secondOrange, in: .capsule)
            }

        }
        .padding()
        .frame(height: 235)
        .frame(maxWidth: .infinity)
        .background(.white, in: .rect(cornerRadius: 20))

    }
}

#Preview {
    ArtistTab(
        artist: Artist(
            name: "KAN DMV",
            age: "49",
            origines: "France",
            style: "Pointillisme"
        )
    )
}

#Preview {
    ArtistView()
}
