//
//  DeviceDetailsView.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import SwiftUI

protocol DeviceDetailsViewControllerCoordinator {}

struct DeviceDetailsView: View {
    // Retrieve device information
    let deviceName = UIDevice.current.name
    let systemName = UIDevice.current.systemName
    let systemVersion = UIDevice.current.systemVersion
    let deviceModel = UIDevice.current.model

    var body: some View {
        VStack(spacing: 20) {
            Text("Device Details")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Display each detail
            HStack {
                Text("Device Name:")
                    .fontWeight(.semibold)
                Spacer()
                Text(deviceName)
            }

            HStack {
                Text("System Name:")
                    .fontWeight(.semibold)
                Spacer()
                Text(systemName)
            }

            HStack {
                Text("System Version:")
                    .fontWeight(.semibold)
                Spacer()
                Text(systemVersion)
            }

            HStack {
                Text("Device Model:")
                    .fontWeight(.semibold)
                Spacer()
                Text(deviceModel)
            }
        }
        .padding()
        .navigationTitle("Device Info")
    }
}

struct DeviceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeviceDetailsView()
        }
    }
}
