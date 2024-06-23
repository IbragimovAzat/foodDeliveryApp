//
//  ProfilePresenter.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 22.06.2024.
//

import Foundation

protocol ProfileViewOutput: AnyObject {
    func myProfile()
    func changePassword()
    func paymentSettings()
    func myVoucher()
    func notification()
    func aboutUs()
    func contactUs()
}

class ProfilePresenter {
    weak var viewInput: ProfileViewInput?
    var coordinator: ProfileCoordinator?
    
    init(viewInput: ProfileViewInput? = nil, coordinator: ProfileCoordinator? = nil) {
        self.viewInput = viewInput
        self.coordinator = coordinator
    }
}

extension ProfilePresenter: ProfileViewOutput {
    func myProfile() {
        
    }
    
    func changePassword() {
        
    }
    
    func paymentSettings() {
        
    }
    
    func myVoucher() {
        
    }
    
    func notification() {
                
    }
    
    func aboutUs() {
        
    }
    
    func contactUs() {
        
    }
}
