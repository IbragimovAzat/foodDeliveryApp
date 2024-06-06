//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 01.06.2024.
//

import UIKit
// MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    // MARK: - Properties
    private let factory = SceneFactory.self
    // MARK: - Methods
    override func start() {
        showOnboarding()
    }
    override func finish() {
        print("Onboarding Coordinator finished")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
// MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
