//
//  HomeViewModel.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    let rooms: BehaviorRelay<[Room]> = BehaviorRelay(value: [])
    let devices: BehaviorRelay<[Device]> = BehaviorRelay(value: [])

    init() {

        let initialRooms = [
            Room(id: 1, name: "Living Room1", devices: [
                Device(id: 1, roomId: 1, name: "Smart Lamp 1", type: .ligthing, isConnected: false),
                Device(id: 2, roomId: 1, name: "Smart Lamp 2", type: .ligthing, isConnected: false)
            ], sensors: [], consumption: [0.9]),
            Room(id: 2, name: "Living Room2", devices: [Device(id: 3, roomId: 2, name: "Smart Lamp 3", type: .ligthing, isConnected: false)], sensors: [], consumption: [0.5])
        ]
        let initialDevices = [
            Device(id: 1, roomId: 1, name: "Smart Lamp 1", type: .ligthing, isConnected: false),
            Device(id: 2, roomId: 1, name: "Smart Lamp 2", type: .ligthing, isConnected: false),
            Device(id: 3, roomId: 2, name: "Smart Lamp 3", type: .ligthing, isConnected: false),
            Device(id: 3, roomId: 2, name: "Smart Lamp 4", type: .ligthing, isConnected: false),
            Device(id: 3, roomId: 2, name: "Smart Lamp 5", type: .ligthing, isConnected: false)
        ]

        rooms.accept(initialRooms)
        devices.accept(initialDevices)
    }
}
