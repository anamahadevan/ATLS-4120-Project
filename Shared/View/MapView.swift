//
//  MapView.swift
//  Journal App (iOS)
//
//  Created by anabelle mahadevan on 10/11/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct ContentView: View { @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.4300, longitude: -122.1700), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02) )

//var body: some View { VStack { Map(coordinateRegion: $region) .edgesIgnoringSafeArea(.all) } } } struct ContentView_Previews: PreviewProvider { static var previews: some View { ContentView() } }

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
