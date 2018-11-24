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
    public static var menuItemsList : [Dimension] {
        get {
                return [UnitLength.init(symbol: ""), UnitTemperature.init(symbol: ""), UnitMass.init(symbol: "")]
        }
    }
    
    public static var lengthUnitsList : [Dimension] {
        get {
            return [UnitLength.meters, UnitLength.kilometers, UnitLength.centimeters]
        }
    }
}
