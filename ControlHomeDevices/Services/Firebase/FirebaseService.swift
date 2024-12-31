//
//  FirebaseService.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 30/12/2024.
//

import FirebaseDatabase
import FirebaseAuth
import FirebaseFirestore
import Combine

class FirebaseService {
    private let database = Database.database().reference().child("HomeDevices")
    private let db = Firestore.firestore()
    let coreDataManager = CoreDataManager()

    // Login function using Firebase Authentication
    func login(email: String, password: String) -> AnyPublisher<String, Error> {
        Future<String, Error> { promise in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    promise(.failure(error))
                } else if let userId = result?.user.uid {
                    promise(.success(userId))
                } else {
                    promise(.failure(NSError(domain: "LoginError", code: -1, userInfo: [NSLocalizedDescriptionKey: "User ID not found"])))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }

    // Fetch user details from Firebase Realtime Database
    func fetchUserDetails(userId: String) -> AnyPublisher<User, Error> {
        Future<User, Error> { [weak self] promise in
            self?.database.child("users").observeSingleEvent(of: .value, with: { snapshot in
                guard let value = snapshot.value as? [String: [String: Any]] else {
                    promise(.failure(NSError(domain: "Firebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])))
                    return
                }
                do {

                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let users = try JSONDecoder().decode([String: User].self, from: jsonData)

                    if let firstUser = users.first(where: { $0.value.userId == userId })?.value {
                        // self?.storeUserLocally(user: firstUser)
                        promise(.success(firstUser))
                    } else {
                        promise(.failure(NSError(domain: "FirebaseError", code: 404, userInfo: [NSLocalizedDescriptionKey: "No users found"])))
                    }

                } catch {
                    promise(.failure(error))
                }
            }, withCancel: { error in
                promise(.failure(error))
            })
        }
        .eraseToAnyPublisher()
    }

    func storeUserLocally(user: User) {
        let userEntity = UserEntity(context: coreDataManager.container.viewContext)
        userEntity.userId = user.userId
        userEntity.userFirstName = user.userFirstName
        userEntity.userLastName = user.userLastName
        coreDataManager.saveUser(user: userEntity)
    }

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

    func fetchHomeDevices() -> AnyPublisher<[Device], any Error> {
        // Use Combine to handle async Firebase data fetch
        Future<[Device], Error> { [weak self] promise in
            self?.database.child("devices").observeSingleEvent(of: .value, with: { snapshot in
                guard let value = snapshot.value as? [String: [String: Any]] else {
                    promise(.failure(NSError(domain: "Firebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])))
                    return
                }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let devices = try JSONDecoder().decode([String: Device].self, from: jsonData)
                    promise(.success(devices.map { $0.value }))
                } catch {
                    promise(.failure(error))
                }
            }, withCancel: { error in
                promise(.failure(error))
            })
        }
        .eraseToAnyPublisher()
    }

    func fetchHomeRooms() -> AnyPublisher<[Room], any Error> {
        // Use Combine to handle async Firebase data fetch
        Future<[Room], Error> { [weak self] promise in
            self?.database.child("rooms").observeSingleEvent(of: .value, with: { snapshot in
                guard let value = snapshot.value as? [String: [String: Any]] else {
                    promise(.failure(NSError(domain: "Firebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])))
                    return
                }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let rooms = try JSONDecoder().decode([String: Room].self, from: jsonData)
                    promise(.success(rooms.map { $0.value }))
                } catch {
                    promise(.failure(error))
                }
            }, withCancel: { error in
                promise(.failure(error))
            })
        }
        .eraseToAnyPublisher()
    }

    /// Fetch devices by roomId
    func fetchRoomDevices(forRoomId roomId: String) -> AnyPublisher<[Device], Error> {
        Future<[Device], Error> { promise in

            self.database.child("devices").observeSingleEvent(of: .value) { snapshot, _ in
                guard let devicesDict = snapshot.value as? [String: [String: Any]] else {
                    promise(.failure(NSError(domain: "InvalidData", code: 0, userInfo: [NSLocalizedDescriptionKey: "No devices found"])))
                    return
                }
                let devices = devicesDict.values.compactMap { deviceData -> Device? in
                    guard
                        let id = deviceData["id"] as? String,
                        let name = deviceData["name"] as? String,
                        let roomId = deviceData["roomId"] as? String,
                        let isOn = deviceData["isOn"] as? Bool,
                        let type = deviceData["type"] as? DeviceType,
                        let isConnected = deviceData["isConnected"] as? Bool
                    else {
                        return nil
                    }
                    return Device(id: id, name: name, roomId: roomId, isOn: isOn, type: type, isConnected: isConnected)
                }
                promise(.success(devices))
            } withCancel: { error in
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
