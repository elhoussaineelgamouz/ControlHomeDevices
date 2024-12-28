//
//  RoomDetailsCoordinator.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit

final class RoomDetailsCoordinator: Coordinator {
    var navigation: UINavigationController
    private var roomDetailsFactory: RoomDetailsFactory
    private var roomItem: Room
    
    init(navigation: UINavigationController, roomDetailsFactory: RoomDetailsFactory, roomItem: Room) {
        self.navigation = navigation
        self.roomDetailsFactory = roomDetailsFactory
        self.roomItem = roomItem
    }
    
    func start() {
        let controller = roomDetailsFactory.makeModule(coordinator: self, roomItem: self.roomItem)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension RoomDetailsCoordinator: RoomDetailsViewControllerCoordinator {}
