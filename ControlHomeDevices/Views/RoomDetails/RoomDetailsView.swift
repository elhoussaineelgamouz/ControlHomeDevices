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

}
