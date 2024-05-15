//
//  ActionSheet.swift
//  Anime
//
//  Created by Syuhada Rantisi on 13/05/24.
//

import SwiftUI

struct ActionSheet: View {
    @State private var showingOptions = false
    @State private var selection = "None"

    var body: some View {
        VStack {
            Text(selection)

            Button("Confirm paint color") {
                showingOptions = true
            }
            .confirmationDialog("Select a color", isPresented: $showingOptions, titleVisibility: .visible) {
                Button("Red") {
                    selection = "Red"
                }

                Button("Green") {
                    selection = "Green"
                }

                Button("Blue") {
                    selection = "Blue"
                }
            }
        }
    }
}

#Preview {
    ActionSheet()
}
