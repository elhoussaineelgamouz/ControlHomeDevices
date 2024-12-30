//
//  SmartLampViewModel.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 30/12/2024.
//
import SwiftUI

class SmartLampViewModel: ObservableObject {
    @Published var isOn: Bool = false

    func toggleSmartLamp() {
        isOn.toggle()
    }
}
