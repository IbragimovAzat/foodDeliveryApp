//
//  LoginViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 11.06.2024.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func login()
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

extension LoginPresenter: LoginViewOutput {
    func login() {
        
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
