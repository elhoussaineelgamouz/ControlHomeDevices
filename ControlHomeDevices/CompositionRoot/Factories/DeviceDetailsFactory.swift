//
//  DeviceDetailsFactory.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit
import Combine
import SwiftUI

protocol DeviceDetailsFactory {
    func makeModule(coordinator: DeviceDetailsViewControllerCoordinator, deviceItem: Device) -> UIViewController
}

struct DeviceDetailsFactoryImp: DeviceDetailsFactory {
    func makeModule(coordinator: DeviceDetailsViewControllerCoordinator, deviceItem: Device) -> UIViewController {
        let deviceDetailsUIView = DeviceDetailsView(deviceId: deviceItem.id)
        let hostingDeviceDetailsController = UIHostingController(rootView: deviceDetailsUIView)
        return hostingDeviceDetailsController
    }
}
