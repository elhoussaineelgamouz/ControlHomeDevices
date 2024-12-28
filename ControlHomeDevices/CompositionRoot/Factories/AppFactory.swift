//
//  AppFactory.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit

protocol AppFactory {
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator
}

struct AppFactoryImp: AppFactory {
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator {
        let loginFactory = LoginFactoryImp()
        let loginCoordinator = LoginCoordinator(navigation: navigation, loginFactory: loginFactory)
        return loginCoordinator
    }
}
