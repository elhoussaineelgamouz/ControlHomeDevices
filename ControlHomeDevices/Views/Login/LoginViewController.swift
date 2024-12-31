//
//  LoginViewController.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 26/12/2024.
//

import UIKit
import LocalAuthentication
import Combine

protocol LoginFactoryControllerCoordinator: AnyObject {
    func didSelectLoginAction()
}

class LoginViewController: UIViewController {

    // MARK: - Properties
    private weak var coordinator: LoginFactoryControllerCoordinator?
    private let authenticationViewModel = AuthenticationViewModel()
    private var viewModel: LoginViewModel!
    private var cancellables = Set<AnyCancellable>()

    // IBOutlets for text fields and labels
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginPasswordLabel: UILabel!
    @IBOutlet weak var loginEmailLabel: UILabel!
    @IBOutlet weak var loginAppTitleLabel: UILabel!
    @IBOutlet weak var touchIDButton: UIButton!
    @IBOutlet weak var userPasswordLabl: UITextField!
    @IBOutlet weak var userEmailLabel: UITextField!
    // MARK: - Button Actions

    @IBAction func loginButtonAction(_ sender: UIButton) {
        self.activityIndicator.startAnimating()
        if viewModel.isConnected {
            guard let email = userEmailLabel.text?.trimmingCharacters(in: .whitespaces), let password = userPasswordLabl.text?.trimmingCharacters(in: .whitespaces) else {
                return
            }
            viewModel.login(email: email, password: password)
        }else{
            print("there is no internet connection")
        }
    }

    @IBAction func touchIDButtonACtion(_ sender: UIButton) {
        authenticationViewModel.authenticateUser()
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
        setUpViews()
        // Observing user
        viewModel.$user
            .sink { [weak self] user in
                if user != nil {
                    self?.coordinator?.didSelectLoginAction()
                    self?.activityIndicator.stopAnimating()
                }
            }
            .store(in: &cancellables)
        //Observing errorMessage
        viewModel.$errorMessage
            .sink { [weak self] errorMessage in
                if let message = errorMessage {
                } else {
                }
            }
            .store(in: &cancellables)

        authenticationViewModel.isAuthenticated = { [weak self] success in
            if success {
                self?.coordinator?.didSelectLoginAction()
            }
        }

        authenticationViewModel.errorMessage = { [weak self] error in
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    private func setUpViews() {
        self.touchIDButton.cornerRadius(40)
        self.loginPasswordLabel.text = L10n.Login.password
        self.loginEmailLabel.text = L10n.Login.email
        self.loginAppTitleLabel.text = L10n.Login.title
        self.loginButton.setTitle(L10n.Login.Button.login, for: .normal)
        self.loginButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
        self.userPasswordLabl.isSecureTextEntry = true
    }

}
