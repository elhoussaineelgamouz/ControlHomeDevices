//
//  AuthenticationModel.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 29/12/2024.
//

import LocalAuthentication

class AuthenticationModel {

    // Function to authenticate the user using biometrics (Touch ID)
    func authenticateUser(completion: @escaping (Bool, String?) -> Void) {
        let context = LAContext()
        var error: NSError?
        // Check if biometric authentication is available
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // Start biometric authentication
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate to access your account") { success, error in
                if success {
                    completion(true, nil) // Success
                } else {
                    completion(false, error?.localizedDescription) // Failure
                }
            }
        } else {
            // If biometrics are not available (e.g., not set up)
            completion(false, "Biometrics not available")
        }
    }
}
