//
//  HomeCoordinator.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit
import Combine

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let homeFactory: HomeFactory!

    init(navigation: UINavigationController, homeFactory: HomeFactory!) {
        self.navigation = navigation
        self.homeFactory = homeFactory
    }

    func start() {
        let controller = homeFactory.makeModel(coordinator: self)
        navigation.pushViewController(controller, animated: false)
    }
}

extension HomeCoordinator: HomeFactoryControllerCoordinator {
    func didSelectItemRoomCell(roomItem: Room) {
        let roomDetailsCoordinator = homeFactory.makeRoomDetailsCoordinator(navigation: navigation, roomItem: roomItem)
       // roomDetailsCoordinator.start()
    }

    func didSelectItemDeviceCell(deviceItem: Device) {
        let deviceDetailsCoordinator = homeFactory.makeDeviceDetailsCoordinator(navigation: navigation, deviceItem: deviceItem)
        deviceDetailsCoordinator.start()
    }
}
