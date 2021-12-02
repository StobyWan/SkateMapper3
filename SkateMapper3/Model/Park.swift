//
//  Park.swift
//  SkateMapper3
//
//  Created by bryan stober on 12/1/21.
//

import Foundation
import MapKit

struct Park: Decodable, Identifiable{
    let id: String
    let name: String
    let address: String
    let city: String
    let state: String
    let zip: Int
    let latitude: String
    let longitude: String
    let rating: Int
    let isActive: String
    let approved: String
    let lastModified: String
    let dateCreated: String
    let fullAddress: String
    let type: String
    let lighting: String
    let surface: String
    
    func getCoord() -> CLLocationCoordinate2D {
        return  CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
    }
}
