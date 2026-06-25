//
//  InfoSheet.swift
//  testUrban
//
//  Created by Guillaume Richard on 23/06/2026.
//

import MapKit
import SwiftUI

struct InfoSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var showFullScreen = false
    let oeuvre: Oeuvre
    var seeDetails: (Oeuvre) -> Void

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Image(.saint)
                    .resizable()
                    .frame(height: 200)

                Text(oeuvre.description)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }

                ToolbarItem(placement: .principal) {
                    Text(oeuvre.title)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        seeDetails(oeuvre)
                    } label: {
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.white)
                            .frame(width: 36, height: 36)
                            .clipShape(.circle)
                            .background(Circle().fill(.orange))
                    }
                }
                .sharedBackgroundVisibility(.hidden)
            }

        }
    }
}

#Preview {
    let oeuvre = ViewModel.mockData
    InfoSheet(oeuvre: oeuvre) { _ in }
}
