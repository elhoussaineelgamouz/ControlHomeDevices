//
//  Sensor.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 28/12/2024.
//

import Foundation

enum SensorType {
    case unknown
    case temperature
    case humidity
    case light
}

extension SensorType {
    var unitLabel: String {
        switch self {
        case .unknown:
            return ""
        case .temperature:
            return "°C"
        case .humidity:
            return "%"
        case .light:
            return "lx"
        }
    }

    var name: String {
        switch self {
        case .unknown:
            return ""
        case .temperature:
            return "Temperature"
        case .humidity:
            return "Humidity"
        case .light:
            return "Light Level"
        }
    }
}

struct Sensor: Codable, Identifiable{
    let id: Int
    let roomId: Int
    let data: Double
   // let type: SensorType
}


