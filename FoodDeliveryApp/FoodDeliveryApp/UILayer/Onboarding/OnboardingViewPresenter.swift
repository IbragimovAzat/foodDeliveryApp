//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 03.06.2024.
//

import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    // MARK: - Properties
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator.finish()
    }
}
