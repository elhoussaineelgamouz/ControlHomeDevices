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

    private let firebaseService = FirebaseService()
    private var cancellables = Set<AnyCancellable>()

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
}
