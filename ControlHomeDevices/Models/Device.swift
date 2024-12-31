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
    let type: DeviceType
    let isConnected: Bool

    static func fromDictionary(_ dictionary: [String: Any], id: String) throws -> Device {
        guard
            let name = dictionary["name"] as? String,
            let roomId = dictionary["roomId"] as? String,
            let isOn = dictionary["isOn"] as? Bool,
            let type = dictionary["type"] as? DeviceType,
            let isConnected = dictionary["isConnected"] as? Bool
        else {
            throw NSError(domain: "InvalidDeviceData", code: 1, userInfo: nil)
        }

        return Device(id: id, name: name, roomId: roomId, isOn: isOn, type: type, isConnected: isConnected)
    }
}
