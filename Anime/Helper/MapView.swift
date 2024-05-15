//
//  MapView.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D


    var body: some View {
        Map(position: .constant(.region(region)))
    }


    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07)
        )
    }
}


#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 1.10459, longitude: 104.12958))
}
