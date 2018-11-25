//
//  MenuItemsList.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 22/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import Foundation
import UIKit

class AppData {
    // Measurement List
    public static var menuItemsList : [Dimension] {
        get {
                return [UnitLength.init(symbol: ""), UnitTemperature.init(symbol: ""), UnitMass.init(symbol: ""), UnitArea.init(symbol: ""), UnitVolume.init(symbol: ""), UnitAngle.init(symbol: "")]
        }
    }
    
    // Unit List
    public static var lengthUnitsList : [UnitLength] {
        get {
            return [UnitLength.meters, UnitLength.kilometers, UnitLength.centimeters, UnitLength.feet, UnitLength.inches, UnitLength.yards, UnitLength.miles]
        }
    }
    
    public static var temperatureUnitsList : [UnitTemperature] {
        get {
            return [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
        }
    }
    
    public static var massUnitsList : [UnitMass] {
        get {
            return [UnitMass.grams, UnitMass.kilograms, UnitMass.metricTons, UnitMass.pounds, UnitMass.ounces, UnitMass.stones]
        }
    }
    
    public static var areaUnitsList : [UnitArea] {
        get {
            return [UnitArea.squareMeters, UnitArea.squareKilometers, UnitArea.squareYards, UnitArea.acres]
        }
    }
    
    public static var volumeUnitsList : [UnitVolume] {
        get {
            return [UnitVolume.cubicMeters, UnitVolume.liters, UnitVolume.gallons, UnitVolume.cups]
        }
    }
    
    public static var angleUnitsList : [UnitAngle] {
        get {
            return [UnitAngle.degrees, UnitAngle.radians, UnitAngle.gradians, UnitAngle.arcSeconds]
        }
    }
}
