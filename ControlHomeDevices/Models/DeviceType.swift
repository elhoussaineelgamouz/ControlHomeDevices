//
//  DeviceType.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Foundation

enum DeviceType {
    case lighting
    case temperature
    case other
}

extension DeviceType {
    var iconName: String {
        switch self {
        case .lighting:
            return "lightbulb.fill"
        case .temperature:
            return "thermometer"
        default:
            return "gearshape2.fill"
        }
    }
}
