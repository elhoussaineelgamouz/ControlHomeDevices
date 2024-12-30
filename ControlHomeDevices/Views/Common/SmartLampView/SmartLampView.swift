//
//  SmartLampView.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 30/12/2024.
//

import SwiftUI

struct SmartLampView: View {
    @StateObject var viewModel: SmartLampViewModel

    var body: some View {
        VStack(spacing: 30) {
            Circle()
                .fill(viewModel.isOn ? Color.yellow : Color.gray)
                .frame(width: 150, height: 150)
                .shadow(color: viewModel.isOn ? .yellow : .clear, radius: 20)
                .overlay(
                    Text(viewModel.isOn ? "ON" : "OFF")
                        .foregroundColor(.white)
                        .bold()
                )
        }
        .padding()
        .animation(.easeInOut, value: viewModel.isOn)
    }
}
