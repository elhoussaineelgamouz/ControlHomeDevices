//
//  RoomDetailsView.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import SwiftUI

protocol RoomDetailsViewControllerCoordinator {}

struct RoomDetailsView: View {
    let room: Room

    @Environment(\.presentationMode) var presentation
    @State private var counterProgress: Double = 0.0
    private let counterSteps = 100.0

    var body: some View {
        GeometryReader { proxy in
            ZStack (alignment: .top) {
                ScrollView {
                    VStack {
                        /*ScrollView(.horizontal, showsIndicators: false) {
                           HStack {
                                ForEach(room.sensors.indices) { index in
                                    let sensor = room.sensors[index]
                                    SensorDataCardView(
                                        data: "\(floor(sensor.data * counterProgress)) \("testest")",
                                        subtitle: "sensor.type.name",
                                        background: index.isMultiple(of: 2)
                                        ? Color.dataBlue
                                        : Color.dataOrange
                                    )
                                }
                            }
                            .padding(.leading, 32 + proxy.safeAreaInsets.leading)
                            .padding(.trailing, 32 + proxy.safeAreaInsets.trailing)
                            .onAppear {
                                Timer.scheduledTimer(
                                    withTimeInterval: 0.75 / counterSteps, repeats: true
                                ) { timer in
                                    counterProgress += 1.0 / counterSteps
                                    if counterProgress >= 1.0 {
                                        timer.invalidate()
                                    }
                                }
                            }
                        }
                        .padding(.leading, -proxy.safeAreaInsets.leading)
                        .padding(.trailing, -proxy.safeAreaInsets.trailing)
                        .ignoresSafeArea()*/

                        Text("Power consumption")
                            .foregroundColor(.fontColor)
                            .font(.system(size:18, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.leading, 32 + proxy.safeAreaInsets.leading)
                            .padding(.trailing, 32 + proxy.safeAreaInsets.trailing)
                            .padding(.leading, 32 + proxy.safeAreaInsets.leading)
                            .padding(.trailing, 32 + proxy.safeAreaInsets.trailing)

                        Text("Devices")
                            .foregroundColor(.fontColor)
                            .font(.system(size:18, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.leading, 32 + proxy.safeAreaInsets.leading)
                            .padding(.trailing, 32 + proxy.safeAreaInsets.trailing)

                       /* ForEach(room.devices) { device in
                            DeviceCardView(device: device, room: room)
                                .padding(.leading, 32 + proxy.safeAreaInsets.leading)
                                .padding(.trailing, 32 + proxy.safeAreaInsets.trailing)
                        }*/
                    }
                    .padding(.leading, proxy.safeAreaInsets.leading)
                    .padding(.trailing, proxy.safeAreaInsets.trailing)
                    .padding(.top, proxy.safeAreaInsets.top + 64)
                }
                .background(Color.background.ignoresSafeArea())
                .navigationBarHidden(true)

                HStack {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.fontColor)
                            .font(.system(size: 16))
                    }
                    .padding(.top, proxy.safeAreaInsets.top + 16)
                    .padding(.leading, proxy.safeAreaInsets.leading + 16)
                    .padding(.bottom, 16)

                    Spacer()
                    Text(room.name)
                        .foregroundColor(.fontColor)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top, proxy.safeAreaInsets.top + 16)
                        .padding(.trailing, proxy.safeAreaInsets.trailing + 16)
                        .padding(.bottom, 16)
                    Spacer()
                }
                .background(Color.background.opacity(0.5).ignoresSafeArea())
            }
            .ignoresSafeArea()
        }
    }
}

struct RoomDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailsView(room: ModelData.rooms[0])
    }
}

