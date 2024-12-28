//
//  LoginFactory.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 28/12/2024.
//

import Combine
import UIKit

protocol LoginFactory {
    func makeModel(coordinator: LoginFactoryControllerCoordinator) -> UIViewController
}

struct LoginFactoryImp: LoginFactory {
    func makeModel(coordinator: LoginFactoryControllerCoordinator) -> UIViewController {
        let LoginViewVC = LoginViewController(viewModel: LoginViewModel(), coordinator: coordinator)
        return LoginViewVC
    }
}

