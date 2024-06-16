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
//        if(userStorage.passedOnboarding) {
//            showAuthFlow()
//        } else {
//            showOnboardingFlow()
//        }
        showMainFlow()
    }
    override func finish() {
        print("AppCoordinator finished")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator =  factory.makeOnboardingFlow(appCoordinator: self, finishDelegate: self, navigationController: navigationController)
        onboardingCoordinator.start()
    }
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(appCoordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    func showAuthFlow() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = factory.makeLoginFlow(appCoordinator: self, finishDelegate: self, navigationController: navigationController)
        loginCoordinator.start()
    }
}
// MARK: -  FinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: any CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
//            navigationController?.viewControllers.removeAll()
            showAuthFlow()
            navigationController?.viewControllers = [
                navigationController?.viewControllers.last ?? UIViewController()
            ]
        case .app:
            return
        case .login:
//            navigationController?.viewControllers.removeAll()
            showMainFlow() 
            navigationController?.viewControllers = [
                navigationController?.viewControllers.last ?? UIViewController()
            ]
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
