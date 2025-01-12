//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Eren Ali Koca on 12.01.2025.
//

import Foundation
import UIKit

class PlaceModel{
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    private init(){}
    //başka hiçbir yerden init edilememesi işlemi 
}
