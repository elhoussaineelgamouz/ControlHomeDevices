//
//  RoomDetailsFactory.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit
import Combine
import SwiftUI

protocol RoomDetailsFactory {
    func makeModule(coordinator: RoomDetailsViewControllerCoordinator, roomItem: Room) -> UIViewController
}

struct RoomDetailsFactoryImp: RoomDetailsFactory {
    func makeModule(coordinator: RoomDetailsViewControllerCoordinator, roomItem: Room) -> UIViewController {
        let roomDetailsUIView = RoomDetailsView(room: roomItem)
        let hostingRoomDetailsController = UIHostingController(rootView: roomDetailsUIView)
        return hostingRoomDetailsController
    }
}

