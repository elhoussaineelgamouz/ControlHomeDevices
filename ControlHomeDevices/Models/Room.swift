//
//  Room.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Foundation

struct Room: Codable, Identifiable {
    let id: String
    let name: String
    let type: RoomType
}
