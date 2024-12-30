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
                Text("Thermostat")
                    .font(.title)
                    .bold()

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

                HStack(spacing: 40) {
                    Button(action: {
                        //viewModel.adjustTemperature(by: -1)  // Decrease temperature
                    }) {
                        Text("-")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }

                    Button(action: {
                        // viewModel.adjustTemperature(by: 1)  // Increase temperature
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

            // Toggle Thermostat On/Off Button
            Button(action: {
                viewModel.toggleSmartThermostat()  // Toggle thermostat state
            }) {
                Text(viewModel.isOn ? "Turn Off" : "Turn On")
                    .font(.headline)
                    .padding()
                    .frame(width: 200)
                    .background(viewModel.isOn ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
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
