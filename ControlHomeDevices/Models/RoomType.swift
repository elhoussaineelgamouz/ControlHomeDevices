//
//  RoomType.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 30/12/2024.
//

import Foundation
import UIKit

enum RoomType: String, Codable {
    case livingRoom
    case kitchen
    case diningRoom
}

extension RoomType {
    var iconName: UIImage {
        switch self {
        case .livingRoom:
            return .icLivingIcon
        case .kitchen:
            return .icKichenIcon
        case .diningRoom:
            return .icDiningDinner
        }
    }
}
