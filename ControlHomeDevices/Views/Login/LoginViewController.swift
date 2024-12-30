//
//  LoginViewController.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 26/12/2024.
//

import UIKit
import LocalAuthentication

protocol LoginFactoryControllerCoordinator: AnyObject {
    func didSelectLoginAction()
}

class LoginViewController: UIViewController {

    // MARK: - Properties
    private weak var coordinator: LoginFactoryControllerCoordinator?
    private let authenticationViewModel = AuthenticationViewModel()
    private var loginViewModel = LoginViewModel()

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginPasswordLabel: UILabel!
    @IBOutlet weak var loginEmailLabel: UILabel!
    @IBOutlet weak var loginAppTitleLabel: UILabel!
    @IBOutlet weak var touchIDButton: UIButton!

    // MARK: - Button Actions

    @IBAction func loginButtonAction(_ sender: UIButton) {
        coordinator?.didSelectLoginAction()
    }

    @IBAction func touchIDButtonACtion(_ sender: UIButton) {
        authenticationViewModel.authenticateUser()
    }
    init(viewModel: LoginViewModel, coordinator: LoginFactoryControllerCoordinator) {
        self.loginViewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()

        authenticationViewModel.isAuthenticated = { [weak self] success in
            if success {
               // self?.statusLabel.text = ""
                print("Authentication Succeeded")
            }
        }

        authenticationViewModel.errorMessage = { [weak self] error in
           // self?.statusLabel.text = "Error: \(error)"
            print("Error: \(error)")
        }
    }

    private func setUpViews() {
        touchIDButton.cornerRadius(40)
        loginPasswordLabel.text = L10n.Login.password
        loginEmailLabel.text = L10n.Login.email
        loginAppTitleLabel.text = L10n.Login.title
        loginButton.setTitle(L10n.Login.Button.login, for: .normal)
    }

}
