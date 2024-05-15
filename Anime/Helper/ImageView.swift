//
//  ImageView.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import SwiftUI

struct ImageView: View {
    var image: Image
    var body: some View {
        VStack {
            image
                .shadow(radius: 7)
        }
    }
}

#Preview {
    ImageView(image: Image("cote"))
}
