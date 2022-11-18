//
//  Planet.swift
//  Solar System
//
//  Created by Kvng Eko on 11/8/22.
//

import Foundation

class Planet {
    var name: String
    var namesake: String
    var imageName: String
    var orderNumber: Int
    var dayLengthInDays: Double
    var yearLengthInDays: Int
    var radiusInMiles: Double
    var moonCount: Int
    var ringCount: Int
    var planetType: String
    var distanceFromSun: Double
    var favorite: Bool
    
    
    init(planetName: String, namesake: String, imageName: String, orderNumber: Int, dayLengthInDays: Double, yearLengthInDays: Int, radiusInMiles: Double, moonCount: Int, ringCount: Int, planetType: String, distanceFromSun: Double,favorite: Bool) {
        self.name = planetName
        self.namesake = namesake
        self.imageName = imageName
        self.orderNumber = orderNumber
        self.dayLengthInDays = dayLengthInDays
        self.yearLengthInDays = yearLengthInDays
        self.radiusInMiles = radiusInMiles
        self.moonCount = moonCount
        self.ringCount = ringCount
        self.planetType = planetType
        self.distanceFromSun = distanceFromSun
        self.favorite = favorite
    }
}


enum PlanetType: String {
    case iceGiant = "Ice Giant"
    case gasGiant = "Gas Giant"
    case terrestrial = "terrestrial"
}

enum PlanetOrder: Int{
    case mercury = 1
    case venus = 2
    case earth = 3
    case mars = 4
    case jupiter = 5
    case saturn  = 6
    case uranus = 7
    case neptune = 8
    
}



