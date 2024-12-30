//
//  DeviceDetailsView.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import SwiftUI

protocol DeviceDetailsViewControllerCoordinator {}

struct DeviceDetailsView: View {
    @StateObject private var deviceDetailsViewModel = DeviceDetailsViewModel()
    @StateObject private var smartLampViewModel = SmartLampViewModel()

    let deviceId: String

    var body: some View {

        VStack {
            if let device = deviceDetailsViewModel.device {
                VStack(spacing: 20) {
                    Text("Device Details")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    SmartLampView(viewModel: smartLampViewModel)
                    Button(action: {
                        smartLampViewModel.toggleSmartLamp()
                    }) {
                        Text(smartLampViewModel.isOn ? "Turn Off" : "Turn On")
                            .font(.headline)
                            .padding()
                            .frame(width: 200)
                            .background(smartLampViewModel.isOn ? Color.red : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    //SmartThermostatView(viewModel: SmartThermostatViewModel())
                }
                .onAppear {
                    smartLampViewModel.isOn = device.isOn
                }
            } else if let errorMessage = deviceDetailsViewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                ProgressView("Loading...")
            }
        }
        .onAppear {
            deviceDetailsViewModel.fetchDeviceDetails(deviceId: deviceId)
        }
        .padding()
    }
}

struct DeviceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeviceDetailsView(deviceId: "device2")
        }
    }
}
