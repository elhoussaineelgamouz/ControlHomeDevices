//
//  Room.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Foundation

struct Room: Hashable, Identifiable {
    let id: Int
    let name: String
    let devices: [Device]
    let consumption: [Double]
}
