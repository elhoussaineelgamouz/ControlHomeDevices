//
//  HomeFactory.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Combine
import UIKit

protocol HomeFactory {
    func makeModel(coordinator: HomeFactoryControllerCoordinator) -> UIViewController
    func makeRoomDetailsCoordinator(
        navigation: UINavigationController,
        roomItem: Room) -> Coordinator
    func makeDeviceDetailsCoordinator(
        navigation: UINavigationController,
        deviceItem: Device) -> Coordinator
}

struct HomeFactoryImp: HomeFactory {
    func makeRoomDetailsCoordinator(navigation: UINavigationController, roomItem: Room) -> Coordinator {
        let roomDetailsFactory = RoomDetailsFactoryImp()
        let roomdetailsCoordinator = RoomDetailsCoordinator(navigation: navigation, roomDetailsFactory: roomDetailsFactory, roomItem: roomItem)
        return roomdetailsCoordinator
    }

    func makeDeviceDetailsCoordinator(navigation: UINavigationController, deviceItem: Device) -> Coordinator {
        let deviceDetailsFactory = DeviceDetailsFactoryImp()
        let devicedetailsCoordinator = DeviceDetailsCoordinator(navigation: navigation, deviceDetailsFactory: deviceDetailsFactory, deviceItem: deviceItem)
        return devicedetailsCoordinator
    }

    func makeModel(coordinator: HomeFactoryControllerCoordinator) -> UIViewController {
        let homeViewModel = HomeViewModel(coordinator: coordinator)
        let HomeViewVC = HomeViewController(viewModel: homeViewModel, coordinator: coordinator)
        return HomeViewVC
    }

}
