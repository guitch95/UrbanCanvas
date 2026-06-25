//
//  DetailsView.swift
//  testUrban
//
//  Created by Guillaume Richard on 22/06/2026.
//

import MapKit
import SwiftUI

struct DetailsView: View {
    let oeuvre: Oeuvre
    @State var position: MapCameraPosition
    var body: some View {
        ScrollView {
        VStack {
            Image(.saint)
                .resizable()
                .frame(height: 300)
            
            Spacer()
                VStack(alignment: .leading) {
                    Text(oeuvre.title)
                        .foregroundStyle(.mainOrange)
                        .font(.title)
                        .bold()
                        .padding(.bottom, 5)
                    
                    
                    Text(oeuvre.description)
                        .padding(.bottom, 10)
                    
                    Text("\(Text("Type").bold()): \(oeuvre.type.rawValue)")
                    
                    Text("\(Text("Condition").bold()): \(oeuvre.condition)")
                    
                    Text("\(Text("Date").bold()): date")
                    
                    Text("\(Text("Auteur").bold()): \(oeuvre.author)")
                    
                    Text("\(Text("Localisation").bold()): \(oeuvre.address).")
                        .padding(.bottom, 10)
                    
                    
                    Map(position: $position) {
                        Annotation(
                            oeuvre.title,
                            coordinate: oeuvre.location
                        ) {
                            Image(.saint)
                                .resizable()
                                .scaledToFit()
                                .clipShape(.circle)
                                .frame(width: 40)
                            
                        }
                        
                    }
                    .frame(height: 150)
                    .clipShape(.rect(cornerRadius: 15))
                    Spacer()
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
    }
}

#Preview {
    let oeuvre = MockData.mockData

    DetailsView(
        oeuvre: oeuvre,
        position:
            .camera(
                MapCamera(
                    centerCoordinate: oeuvre.location,
                    distance: 2000,
                )
            )

    )
}
