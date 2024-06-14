//
//  LoginViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 11.06.2024.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStarted(login: String, password: String)
    func registration()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPassword()
    func back()
}

class LoginPresenter {
    // MARK: - Properties
    private var coordinator: AppCoordinator?
    weak var viewInput: LoginViewInput?
    
    // MARK: - Initializers
    init(coordinator: AppCoordinator? = nil , viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}

private extension LoginPresenter {
    func goToMainScreen() {
        coordinator?.showMainScene()
    }
}

extension LoginPresenter: LoginViewOutput {
    func loginStarted(login: String, password: String) {
        viewInput?.startLoader()
        if(login == "Test" && password == "Test") {
            print("success")
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
                DispatchQueue.main.async { [weak self] in
                    self?.viewInput?.stopLoader()
                    self?.goToMainScreen()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
                self?.viewInput?.stopLoader()
                print("wrong test data")
            }
        }
    }
    
    func registration() {
        
    }
    
    func goToFacebookLogin() {
    
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgotPassword() {
        
    }
    
    func back() {

    }
    
    
}
