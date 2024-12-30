//
//  SmartThermostatViewModel.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 30/12/2024.
//

import SwiftUI

class SmartThermostatViewModel: ObservableObject {
    @Published var isOn: Bool = false

    // Toggle smartThermostat on/off
    func toggleSmartThermostat() {
        isOn.toggle()
    }
}
