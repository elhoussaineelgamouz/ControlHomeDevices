//
//  AuthenticationViewModel.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 29/12/2024.
//

import Foundation

class AuthenticationViewModel {

    private let viewModel = AuthenticationModel()

    // Observable properties to bind with the View
    var isAuthenticated: ((Bool) -> Void)?
    var errorMessage: ((String) -> Void)?

    // Function to authenticate the user through the Model
    func authenticateUser() {
        viewModel.authenticateUser { [weak self] success, error in
            if success {
                self?.isAuthenticated?(true) // Notify View that authentication succeeded
            } else {
                if let error = error {
                    self?.errorMessage?(error) // Notify View about the error
                }
            }
        }
    }
}

