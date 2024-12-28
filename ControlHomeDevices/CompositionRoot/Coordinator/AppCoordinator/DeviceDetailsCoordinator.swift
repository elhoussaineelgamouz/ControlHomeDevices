//
//  DeviceDetailsCoordinator.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit

final class DeviceDetailsCoordinator: Coordinator {
    var navigation: UINavigationController
    private var deviceDetailsFactory: DeviceDetailsFactory
    private var deviceItem: Device
    
    init(navigation: UINavigationController, deviceDetailsFactory: DeviceDetailsFactory, deviceItem: Device) {
        self.navigation = navigation
        self.deviceDetailsFactory = deviceDetailsFactory
        self.deviceItem = deviceItem
    }
    
    func start() {
        let controller = deviceDetailsFactory.makeModule(coordinator: self, deviceItem: self.deviceItem)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension DeviceDetailsCoordinator: DeviceDetailsViewControllerCoordinator {}
