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

class HomeViewModel: ObservableObject {

    private var databaseRef: DatabaseReference
    private var cancellables = Set<AnyCancellable>()
    private let firebaseService = FirebaseService()

    @Published var devicesArray: [Device] = []

    var rooms: BehaviorRelay<[Room]> = BehaviorRelay(value: [])
    var devices: BehaviorRelay<[Device]> = BehaviorRelay(value: [])
    var coordinator: HomeFactoryControllerCoordinator?

    init(coordinator: HomeFactoryControllerCoordinator)  {
        databaseRef = Database.database().reference().child("HomeDevices")

        // Bind the devicesSubject to the @Published property

        self.fetchHomeRooms()
        self.fetchHomeDevices()

        self.coordinator = coordinator
    }

    func fetchHomeDevices() {
        firebaseService.fetchHomeDevices()
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
        firebaseService.fetchHomeRooms()
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
