//
//  Device.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Foundation

struct Device: Codable, Identifiable {
    let id: String
    let name: String
    let roomId: String
    let isOn: Bool
    let type: String
    let isConnected: Bool
}
