//
//  DetailView.swift
//  SkateMapper3
//
//  Created by bryan stober on 12/1/21.
//

import SwiftUI
import MapKit

struct DetailView: View {
    let park: Park!
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 3.164557, longitude: 101.713423), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State private var trackingMode = MapUserTrackingMode.follow
    var body: some View {
        VStack{
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: [park]) { (location) -> MapPin in
                MapPin(coordinate: location.getCoord(), tint: .black)
            }
            .onAppear {
                if let lat = Double(park.latitude), let lng = Double(park.longitude) {
                    region.center = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                }
            }
            .edgesIgnoringSafeArea(.all)
            Text(park.name)
            HStack {
                Text(park.surface)
                Text(park.type)
            }
            Text(park.fullAddress)
        }
    }
}
