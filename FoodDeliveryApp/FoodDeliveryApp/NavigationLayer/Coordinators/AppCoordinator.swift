//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 01.06.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
//        showOnboardingFlow()
        if(userStorage.passedOnboarding) {
            showAuthFlow()
        } else {
            showOnboardingFlow()
        }
//        let loginPresenter = LoginPresenter(coordinator: self)
//        let loginVC = LoginViewController(viewOutput: loginPresenter, state: .initial)
//        navigationController?.pushViewController(loginVC, animated: true)
    }
    override func finish() {
        print("AppCoordinator finished")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(appCoordinator: self, finishDelegate: self, navigationController: navigationController)
    }
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(appCoordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    func showAuthFlow() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
// MARK: - Navigation public methods
extension AppCoordinator {
    func showSignInScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignInScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func showSignUpScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: any CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showAuthFlow ()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
