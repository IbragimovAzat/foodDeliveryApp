//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 06.06.2024.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}

class LoginViewController: UIViewController {
    // MARK: - Properties
    private var state: LoginViewState = .initial
    weak var viewOutput: LoginViewOutput?
    
    // MARK: - Views
    private lazy var bottomView = BottomView()
    private lazy var textField = FDTextField()
    private lazy var logoImage: UIImageView = UIImageView()
    private lazy var signInButton: FDButton = {
        let button = FDButton(color: .white)
        button.setTitle("Sign In", for: .normal)
        return button
    }()
    private lazy var signUpButton: FDButton = {
        let button = FDButton(color: .grey)
        button.setTitle("Sign Up", for: .normal)
        return button
    }()

    // MARK: - Initializers
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupActions()
    }
}

private extension LoginViewController {
    func setupLayout() {
        switch state {
            case .initial:
                setupBottomView()
                setupLogoImage()
                setupSignInButton()
                setupSignUpButton()
            case .signIn:
                setupBottomView()
                setupTextField()
            case .signUp:
                setupBottomView()
                setupTextField()
        }
    }
    func setupBottomView() {
        self.view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 354)
        ])
    }
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .appstore)
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            logoImage.heightAnchor.constraint(equalToConstant: 300),
            logoImage.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
//        signInButton.buttonScheme = .orange
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupActions() {
        bottomView.firstButtonTapped = facebookButtonTapped
        bottomView.secondButtonTapped = googleButtonTapped
    }
    func facebookButtonTapped() {
        print("facebook")
    }
    func googleButtonTapped() {
        print("google")
    }
}

extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        
    }
    
    func onSignUpTapped() {
        
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    
}

#Preview("LoginVC") {
    LoginViewController(viewOutput: LoginPresenter(), state: .initial)
}
