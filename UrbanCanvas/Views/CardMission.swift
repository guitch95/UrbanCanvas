//
//  CardMission.swift
//  testUrban
//
//  Created by Guillaume Richard on 24/06/2026.
//

import SwiftUI

struct CardMission: View {
    let oeuvre: Oeuvre
    var body: some View {
        VStack{
            HStack(spacing: 20) {
                Image(oeuvre.photo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                VStack(alignment: .leading) {
                    Text(oeuvre.title)
                        .bold()
                        .padding(.bottom, 10)

                    Text("\(Text("Auteur/rice:").bold()) \(oeuvre.author)")
                        .font(.callout)
                    Text(
                        "\(Text("Type d'art").bold()): \(oeuvre.type.rawValue)"
                    )
                    .font(.callout)

                    Text("\(Text("Ville").bold()): \(oeuvre.city)")
                        .font(.callout)
                }
            }
            .foregroundStyle(.mainText)
        }
        .padding()
        .frame(width: 350, height: 200)
        .background(.orange.opacity(0.6), in: .rect(cornerRadius: 20))
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    let oeuvre = MockData.mockData
    CardMission(oeuvre: oeuvre)
}
