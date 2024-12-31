//
//  DeviceType.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Foundation
import UIKit

enum DeviceType: String, Codable {
    case ligthing
    case temperature
}

extension DeviceType {
    var iconName: UIImage {
        switch self {
        case .ligthing:
            return .icSmartlampLam
        case .temperature:
            return .icThermostatIcon
        }
    }
}
