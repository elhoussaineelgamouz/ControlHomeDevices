//
//  Device.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Foundation

struct Device: Hashable, Identifiable {
    let id: Int
    let roomId: Int
    let name: String
    let type: DeviceType
    let isConnected: Bool
}
