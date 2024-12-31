//
//  RoomDetailsView.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import SwiftUI
import Combine

protocol RoomDetailsViewControllerCoordinator {}

struct RoomDetailsView: View {
    let room: Room

    @StateObject var viewModel = RoomDetailsViewModel()
    @Environment(\.presentationMode) var presentation

    var body: some View {
        GeometryReader { proxy in
            ZStack (alignment: .top) {
                ScrollView {
                    VStack {
                        Text("Power consumption")
                            .foregroundColor(.white)
                            .font(.system(size:18, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.leading, 32 + proxy.safeAreaInsets.leading)
                            .padding(.trailing, 32 + proxy.safeAreaInsets.trailing)
                            .padding(.leading, 32 + proxy.safeAreaInsets.leading)
                            .padding(.trailing, 32 + proxy.safeAreaInsets.trailing)

                        Text("Devices")
                            .foregroundColor(.white)
                            .font(.system(size:18, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.leading, 32 + proxy.safeAreaInsets.leading)
                            .padding(.trailing, 32 + proxy.safeAreaInsets.trailing)

                        ForEach(viewModel.devices) { device in
                            DeviceCardView(device: device, room: room)
                                .padding(.leading, 32 + proxy.safeAreaInsets.leading)
                                .padding(.trailing, 32 + proxy.safeAreaInsets.trailing)
                        }
                    }
                    .padding(.leading, proxy.safeAreaInsets.leading)
                    .padding(.trailing, proxy.safeAreaInsets.trailing)
                    .padding(.top, proxy.safeAreaInsets.top + 64)
                }
                .background(Color.mainBackground.ignoresSafeArea())
                .navigationBarHidden(true)

                HStack {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                    }
                    .padding(.top, proxy.safeAreaInsets.top + 16)
                    .padding(.leading, proxy.safeAreaInsets.leading + 16)
                    .padding(.bottom, 16)

                    Spacer()
                    Text(room.name)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top, proxy.safeAreaInsets.top + 16)
                        .padding(.trailing, proxy.safeAreaInsets.trailing + 16)
                        .padding(.bottom, 16)
                    Spacer()
                }
                .background(Color.mainBackground.opacity(0.5).ignoresSafeArea())
            }
            .ignoresSafeArea()
        }
        .onAppear {
            viewModel.fetchRoomDevices(forRoomId: room.id)
        }
    }
}

struct RoomDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailsView(room: Room(id: "room1", name: "room1", type: .diningRoom))
    }
}

