//
//  ModelData.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 28/12/2024.
//

import Foundation


struct ModelData {

    static let rooms: [Room] = Self.generateRooms()

    static var allDevices: [Device] {
        //Self.rooms.map{ $0.devices }.reduce([], +)
        return []
    }

    static func room(withId: Int) -> Room? {
        Self.rooms.first { room in String(room.id) == String(withId)}
    }

    private static var lastId = 0
    private static func generateRooms() -> [Room] {
        ["Living Room", "Dining Room", "Bedroom"].enumerated().map { (i, name) in
            let roomId = nextId()
            return Room(
                id: "\(roomId)",
                name: name
            )
        }
    }

    private static func generateDevices(roomId: Int) -> [Device] {
        [
            ("Smart Lamp 1", DeviceType.ligthing),
            ("Smart Lamp 2", DeviceType.ligthing),
            ("Thermostat", DeviceType.temperature)
        ].map { device in
            Device(id: "\(nextId())", name: "", roomId: "\(roomId)", isOn: true, type: device.0, isConnected: false)
        }
    }

    private static func generateSensors(roomId: Int) -> [Sensor] {
        [SensorType.temperature, SensorType.humidity].map { type in
            Sensor(id: nextId(), roomId: roomId, data: Double.random(in: 15.0...40.0))
        }
    }

    private static func nextId() -> Int {
        lastId += 1
        return lastId
    }
}

