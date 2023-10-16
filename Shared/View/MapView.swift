//
//  MapView.swift
//  Journal App (iOS)
//
//  Created by anabelle mahadevan on 10/11/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 40.0077,longitude: 105.2700),
        span:MKCoordinateSpan(latitudeDelta:0.01,
                              longitudeDelta: 0.01)
        )
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region)
        }.edgesIgnoringSafeArea(.all)
    }
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
