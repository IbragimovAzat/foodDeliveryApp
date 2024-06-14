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
    func startLoader()
    func stopLoader()
}

class LoginViewController: UIViewController {
    // MARK: - Properties
    private var state: LoginViewState = .initial
    var viewOutput: LoginViewOutput!
    private var isKeyboardShown = false
    private var bottomCTValue = 0.0
    
    // MARK: - Views
    private lazy var bottomView = BottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUsername = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnterPass = FDTextField()
    private lazy var forgotLabel = UILabel()
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
    private lazy var verticalStack = UIStackView()
    private lazy var loader = UIActivityIndicatorView(style: .large)
    private lazy var loaderContainer = UIView()
    
    // MARK: - Constraints
    private var stackViewBottomCT = NSLayoutConstraint()

    // MARK: - Initializers
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        stopKeyboardListener()
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupActions()
        setupObservers()
    }
}
// MARK: - Layout
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
                setupVerticalStack()
                setupSignInPassword()
                setupSignInUsername()
                setupTitleLabel()
                setupSignInButton()
                setupForgotLabel()
                setupNavigationBar()
            case .signUp:
                setupBottomView()
                setupVerticalStack()
                setupSignUpPasssword()
                setupSignUpUsername()
                setupSignUpReEnterPass()
                setupSignUpButton()
                setupForgotLabel()
                setupTitleLabel()
                setupNavigationBar()
        }
        setupLoaderView()
    }
    func setupNavigationBar() {
        let backImage = UIImage(resource: .back)
        let backButton = UIBarButtonItem(image: backImage,
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = AppColors.black
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
    func  setupVerticalStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        
        switch state {
        case .initial:
            return
        case .signIn:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            bottomCTValue = -262
            stackViewBottomCT = verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCTValue)
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackViewBottomCT
//                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -262)
            ])
        case .signUp:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnterPass)
            bottomCTValue = -227
            stackViewBottomCT = verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCTValue)
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -227)
                stackViewBottomCT
            ])
        }
    }
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.Roboto.bold.size(of: 24)
        switch state {
            case .signIn:
                titleLabel.text = "Sign In"
            case .signUp:
                titleLabel.text = "Sign Up"
            default:
                titleLabel.text = ""
        }
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34)
        ])
    }
    func setupSignInUsername() {
//        view.addSubview(signInUsername)
        signInUsername.placeholder = "Username"
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            signInUsername.bottomAnchor.constraint(equalTo: signInPassword.topAnchor, constant: -20),
            signInUsername.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signInUsername.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signInUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignInPassword() {
//        view.addSubview(signInPassword)
        signInPassword.placeholder = "Password"
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInPassword.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signInPassword.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            signInPassword.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            signInPassword.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.text = "Forgot Password?"
        forgotLabel.textColor = AppColors.lineGrey
        forgotLabel.font = UIFont.Roboto.regular.size(of: 14)
        
        switch state {
            case .signIn:
                NSLayoutConstraint.activate([
                    forgotLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                    forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20)
                ])
            case .signUp:
                NSLayoutConstraint.activate([
                    forgotLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                    forgotLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20)
                ])
            default:
                break
        }
    }
    func setupSignUpUsername() {
//        view.addSubview(signUpUsername)
        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        signUpUsername.placeholder = "Enter Username"
        
        NSLayoutConstraint.activate([
            signUpUsername.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signUpUsername.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            signUpUsername.bottomAnchor.constraint(equalTo: signUpPassword.topAnchor, constant: -20),
            signUpUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpPasssword() {
//        view.addSubview(signUpPassword)
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter Password"
        
        NSLayoutConstraint.activate([
            signUpPassword.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signUpPassword.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            signUpPassword.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpReEnterPass() {
//        view.addSubview(signUpReEnterPass)
        signUpReEnterPass.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnterPass.placeholder = "Re-Enter Password"
        
        NSLayoutConstraint.activate([
            signUpReEnterPass.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signUpReEnterPass.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            signUpReEnterPass.topAnchor.constraint(equalTo: signUpPassword.bottomAnchor, constant: 20),
            signUpReEnterPass.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .loginLogo)
        logoImage.layer.cornerRadius = 24
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            logoImage.widthAnchor.constraint(equalToConstant: 300),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
        ])
    }
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.buttonAction = onSignInTapped
        
        switch state {
        case .initial:
            NSLayoutConstraint.activate([
                signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signIn:
            NSLayoutConstraint.activate([
                signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                signInButton.topAnchor.constraint(equalTo: signInPassword.bottomAnchor, constant: 30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            NSLayoutConstraint.activate([
                signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                signUpButton.topAnchor.constraint(equalTo: signUpReEnterPass.bottomAnchor, constant: 20),
                signUpButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
    }
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        switch state {
        case .initial:
            signUpButton.buttonAction = onSignUpTapped
            NSLayoutConstraint.activate([
                signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
                signUpButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            NSLayoutConstraint.activate([
                signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                signUpButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 20),
                signUpButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        default:
            break
        }
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
    func setupLoaderView() {
        view.addSubview(loaderContainer)
        loaderContainer.translatesAutoresizingMaskIntoConstraints = false
        loaderContainer.backgroundColor = AppColors.black.withAlphaComponent(0.2)
        loaderContainer.isHidden = true
        loaderContainer.center = view.center
        
        NSLayoutConstraint.activate([
            loaderContainer.widthAnchor.constraint(equalToConstant: view.frame.width),
            loaderContainer.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
        
        loaderContainer.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: loaderContainer.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: loaderContainer.centerYAnchor)
        ])
    }
}

// MARK: - private methods
private extension LoginViewController {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignIn()
        case .signIn:
            viewOutput.loginStarted(login: signInUsername.text ?? "", password: signInPassword.text ?? "")
        case .signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignUp()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
}

// MARK: - LoginViewInput delegate
extension LoginViewController: LoginViewInput {
    func startLoader() {
        loaderContainer.isHidden = false
        loader.startAnimating()
    }
    
    func stopLoader() {
        loaderContainer.isHidden = true
        loader.stopAnimating()
    }
    
    
}

// MARK: - Observers
private extension LoginViewController {
    func setupObservers() {
        startKeyboardListener()
    }
    func startKeyboardListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    func stopKeyboardListener() {
        NotificationCenter.default.removeObserver(self)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer ) {
        // Hide a keyboard while tapped
        view.endEditing(true)
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        if !isKeyboardShown {
            UIView.animate(withDuration: 0.3) {
                self.stackViewBottomCT.constant -= keyboardHeight/4
                self.view.layoutIfNeeded()
                self.isKeyboardShown = true
            }
        }
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        if isKeyboardShown {
            UIView.animate(withDuration: 0.3) {
                self.stackViewBottomCT.constant = self.bottomCTValue
                self.view.layoutIfNeeded()
                self.isKeyboardShown = false
            }
        }
    }
}


//#Preview("LoginVC") {
//    LoginViewController(viewOutput: LoginPresenter(), state: .initial)
//}

