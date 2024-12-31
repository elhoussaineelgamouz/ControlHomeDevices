//
//  DeviceCardView.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import SwiftUI

struct DeviceCardView: View {
    let device: Device
    let room: Room?

    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(device.name)
                    .foregroundColor(.secondary)
                    .font(.system(size:18, weight: .bold, design: .rounded))
                    .lineLimit(1)
                Spacer()
                Text(room?.name ?? "")
                    .foregroundColor(.secondaryFont)
                    .font(.system(size:12, weight: .bold, design: .rounded))
                    .lineLimit(1)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Toggle("", isOn: .constant(device.isConnected))
                    .toggleStyle(DeviceConnectionToggleStyle())
                Spacer()
                Text(device.isConnected ? "connected" : "not connected")
                    .foregroundColor(.secondaryFont)
                    .font(.system(size:12, weight: .bold, design: .rounded))
            }
        }
        .padding()
        .frame(height: 120)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.panelColor))
    }
}

struct DeviceCardView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceCardView(device: Device(id: "", name: "", roomId: "", isOn: false, type: .ligthing, isConnected: true), room: Room(id: "", name: "", type: .diningRoom))
    }
}
