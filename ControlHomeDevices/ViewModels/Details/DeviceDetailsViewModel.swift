//
//  DeviceDetailsViewModel.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 28/12/2024.
//

import Foundation
import RxSwift
import RxCocoa
import Combine

class DeviceDetailsViewModel: ObservableObject {

    @Published var device: Device?
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let firebaseService = FirebaseService()

    func fetchDeviceDetails(deviceId: String) {
        firebaseService.fetchDeviceDetails(deviceId: deviceId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] device in
                self?.device = device
            }
            .store(in: &cancellables)
    }
}

