//
//  ListItem.swift
//  testUrban
//
//  Created by Guillaume Richard on 24/06/2026.
//

import SwiftUI

struct ListItem: View {
    let oeuvre: Oeuvre
    var body: some View {
        HStack {
            Image(.saint)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(.circle)
            
            VStack(alignment: .leading){
                Text(oeuvre.title)
                HStack {
                    Image(systemName: "mappin.circle.fill")
                    Text(oeuvre.city)
                }
                .foregroundStyle(.secondText)
            }
            
        }
    }
}

#Preview {
    ListItem(oeuvre: MockData.mockData)
}


#Preview {
    ListView(selectedType: .constant(OeuvreType.tous))
}
