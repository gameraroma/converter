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
    public static var menuItemsList : [Menu] {
        get {
                return [Menu(name: "Length", icon: UIImage(named: "length")), Menu(name: "Temperature", icon: nil), Menu(name: "Mass", icon: nil)]
        }
    }
    
    public static var lengthUnitsList : [Unit] {
        get {
            return [UnitLength.meters, UnitLength.kilometers, UnitLength.centimeters]
        }
    }
}
