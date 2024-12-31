//
//  SmartThermostatView.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 30/12/2024.
//

import SwiftUI

struct SmartThermostatView: View {
    @StateObject var viewModel = SmartThermostatViewModel()  // ViewModel initialization
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Circle()
                    .fill(viewModel.isOn ? Color.green : Color.gray)
                    .frame(width: 150, height: 150)
                    .overlay(
                        Text(viewModel.isOn ? "ON" : "OFF")
                            .foregroundColor(.white)
                            .bold()
                    )
                    .shadow(radius: 10)
            }
            // Temperature Display
            VStack {
                Text("Temperature: °C")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.white)

                HStack(spacing: 40) {
                    Button(action: {
                    }) {
                        Text("-")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }

                    Button(action: {
                    }) {
                        Text("+")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding()
        .animation(.easeInOut, value: viewModel.isOn)
    }
}

struct ThermostatView_Previews: PreviewProvider {
    static var previews: some View {
        SmartThermostatView()
    }
}
