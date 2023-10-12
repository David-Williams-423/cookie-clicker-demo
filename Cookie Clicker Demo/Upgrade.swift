//
//  Upgrade.swift
//  Cookie Clicker Demo
//
//  Created by David Williams on 10/12/23.
//

import Foundation
import SwiftUI

struct Upgrade {    
    var name: String
    var imageString: String
    var powerDescription: String
    var price: Int
    var power: (Int) -> Int
    
    static var upgrades: [Upgrade] {
        return [
            Upgrade(name: "Extra Hand", imageString: "Hand", powerDescription: "Doubles every cookie click", price: 10, power: { cookie in cookie * 2 }),
            Upgrade(name: "Rolling Pin", imageString: "RollingPin", powerDescription: "Extra 5 cookies per click", price: 20, power: { cookie in cookie + 5 }),
        ]
    }
}
