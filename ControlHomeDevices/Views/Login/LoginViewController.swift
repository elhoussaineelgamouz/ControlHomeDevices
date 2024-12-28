//
//  LoginViewController.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 26/12/2024.
//

import UIKit

protocol LoginFactoryControllerCoordinator: AnyObject {
    func didSelectLoginAction()
}

class LoginViewController: UIViewController {

    // MARK: - Properties
    private weak var coordinator: LoginFactoryControllerCoordinator?
    private var viewModel = LoginViewModel()

    // MARK: - Button Actions
    @IBAction func loginButtonAction(_ sender: UIButton) {
        coordinator?.didSelectLoginAction()
    }

    init(viewModel: LoginViewModel, coordinator: LoginFactoryControllerCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
