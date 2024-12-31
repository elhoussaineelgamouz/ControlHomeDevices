//
//  NetworkManager.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 31/12/2024.
//

import Foundation
import Network
import Combine

class NetworkManager: ObservableObject {
    private var monitor: NWPathMonitor?
    private let queue = DispatchQueue(label: "NetworkMonitorQueue")

    @Published var isConnected: Bool = false
    @Published var isExpensive: Bool = false

    init() {
        startMonitoring()
    }

    private func startMonitoring() {
        monitor = NWPathMonitor()

        monitor?.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
                self?.isExpensive = path.isExpensive
            }
        }

        monitor?.start(queue: queue)
    }

    deinit {
        monitor?.cancel()
    }
}
