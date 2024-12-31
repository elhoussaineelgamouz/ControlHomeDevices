//
//  RoomDetailsViewModel.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 28/12/2024.
//

import Foundation
import RxSwift
import RxCocoa
import Combine

class RoomDetailsViewModel: ObservableObject {

    @Published var devices: [Device] = []
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let firebaseService = FirebaseService()

    func fetchRoomDevices(forRoomId roomId: String) {
        firebaseService.fetchRoomDevices(forRoomId: roomId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] devices in
                self?.devices = devices
            }
            .store(in: &cancellables)
    }
}
