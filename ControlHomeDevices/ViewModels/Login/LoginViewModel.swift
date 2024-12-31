//
//  LoginViewModel.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 28/12/2024.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    @Published var isConnected: Bool = true

    private let firebaseService = FirebaseService()
    private let coreDataManager = CoreDataManager()
    private var cancellables = Set<AnyCancellable>()
    private var networkManager = NetworkManager()

    init() {
        // Observe changes of the NetworkManager
        networkManager.$isConnected
            .sink { [weak self] isConnected in
                self?.isConnected = isConnected
            }
            .store(in: &cancellables)
    }

    func login(email: String, password: String) {
        firebaseService.login(email: email, password: password)
            .flatMap { userId in
                self.firebaseService.fetchUserDetails(userId: userId)
            }
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { user in
                self.user = user
            })
            .store(in: &cancellables)
    }

    
    func fetchUserDetailsLocally(userId: String) {
        self.coreDataManager.fetchUsers()
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    // self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { users in
                // Find the first user matching the userId
                if let firstUser = users.first(where: { $0.userId == userId }) {
                    self.user = firstUser.toUser()
                } else {
                    //self.errorMessage = error.localizedDescription
                }
            })
            .store(in: &self.cancellables)
    }
}
