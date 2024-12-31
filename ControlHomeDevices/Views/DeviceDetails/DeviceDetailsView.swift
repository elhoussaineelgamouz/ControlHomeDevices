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
        GeometryReader { proxy in
            VStack (alignment: .center) {
                if let device = deviceDetailsViewModel.device {
                    VStack(spacing: 20) {
                        Text(device.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        if device.type == .ligthing {
                            SmartLampView(viewModel: smartLampViewModel)
                        } else {
                            SmartThermostatView(viewModel: SmartThermostatViewModel())
                        }
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
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
            .background(Color.mainBackground)
        }
        .ignoresSafeArea()
    }

}


struct DeviceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeviceDetailsView(deviceId: "device2")
        }
    }
}
