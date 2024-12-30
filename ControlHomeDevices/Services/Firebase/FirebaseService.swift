//
//  FirebaseService.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 30/12/2024.
//

import FirebaseDatabase
import Combine

class FirebaseService {
    private let database = Database.database().reference().child("HomeDevices")

    func fetchDeviceDetails(deviceId: String) -> AnyPublisher<Device, Error> {
        Future { promise in
            self.database.child("devices").child(deviceId).observeSingleEvent(of: .value) { snapshot in
                guard let value = snapshot.value else {
                    return promise(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data found"])))
                }
                do {
                    let data = try JSONSerialization.data(withJSONObject: value)
                    let device = try JSONDecoder().decode(Device.self, from: data)
                    promise(.success(device))
                } catch {
                    promise(.failure(error))
                }
            } withCancel: { error in
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
