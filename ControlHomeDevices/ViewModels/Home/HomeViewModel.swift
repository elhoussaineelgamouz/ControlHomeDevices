//
//  HomeViewModel.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Foundation
import RxSwift
import RxCocoa
import FirebaseDatabase
import Combine

class HomeViewModel {

    private var databaseRef: DatabaseReference
    private var cancellables = Set<AnyCancellable>()

    var rooms: BehaviorRelay<[Room]> = BehaviorRelay(value: [])
    var devices: BehaviorRelay<[Device]> = BehaviorRelay(value: [])
    var coordinator: HomeFactoryControllerCoordinator?

    init(coordinator: HomeFactoryControllerCoordinator) {
        databaseRef = Database.database().reference().child("HomeDevices")
        self.fetchHomeDevices()
        self.fetchHomeRooms()
        self.coordinator = coordinator
    }

    func fetchHomeDevices() {
        // Use Combine to handle async Firebase data fetch
        Future<[Device], Error> { [weak self] promise in
            self?.databaseRef.child("devices").observeSingleEvent(of: .value, with: { snapshot in
                guard let value = snapshot.value as? [String: [String: Any]] else {
                    promise(.failure(NSError(domain: "Firebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])))
                    return
                }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let devices = try JSONDecoder().decode([String: Device].self, from: jsonData)
                    promise(.success(devices.map { $0.value }))
                } catch {
                    promise(.failure(error))
                }
            }, withCancel: { error in
                promise(.failure(error))
            })
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completion in
            if case let .failure(error) = completion {
                // self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] devices in
            self?.devices.accept(devices)
        }
        .store(in: &cancellables)
    }

    func fetchHomeRooms() {
        // Use Combine to handle async Firebase data fetch
        Future<[Room], Error> { [weak self] promise in
            self?.databaseRef.child("rooms").observeSingleEvent(of: .value, with: { snapshot in
                guard let value = snapshot.value as? [String: [String: Any]] else {
                    promise(.failure(NSError(domain: "Firebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])))
                    return
                }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let rooms = try JSONDecoder().decode([String: Room].self, from: jsonData)
                    promise(.success(rooms.map { $0.value }))
                } catch {
                    promise(.failure(error))
                }
            }, withCancel: { error in
                promise(.failure(error))
            })
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completion in
            if case let .failure(error) = completion {
                // self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] fetchedRooms in
            DispatchQueue.main.async {
                self?.rooms.accept(fetchedRooms)
            }
        }
        .store(in: &cancellables)
    }

    func showRoomDetails(roomItem: Room) {
        coordinator?.didSelectItemRoomCell(roomItem: roomItem)
    }

    func showDeviceDetails(deviceItem: Device) {
        coordinator?.didSelectItemDeviceCell(deviceItem: deviceItem)
    }


}
