//
//  LoginCoordinator.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 28/12/2024.
//

import UIKit
import Combine

final class LoginCoordinator: Coordinator {
    var navigation: UINavigationController
    private let loginFactory: LoginFactory!

    init(navigation: UINavigationController, loginFactory: LoginFactory!) {
        self.navigation = navigation
        self.loginFactory = loginFactory
    }

    func start() {
        let controller = loginFactory.makeModel(coordinator: self)
        navigation.pushViewController(controller, animated: false)
    }
}

extension LoginCoordinator: LoginFactoryControllerCoordinator {
    func didSelectLoginAction() {
        print("lhamdolilah")
    }
}
