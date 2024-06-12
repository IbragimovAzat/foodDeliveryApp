//
//  SceneFactory.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 06.06.2024.
//

import UIKit

struct SceneFactory {
    // MARK: - Onboarding flow
    static func makeOnboardingFlow(appCoordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        appCoordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [OnboardingPartViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        firstVC.imageToShow =  UIImage(resource: .chickenLeg1)
        firstVC.buttonText = "Next"
        
        let secondVC = OnboardingPartViewController()
        secondVC.titleText = "Fast shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.imageToShow =  UIImage(resource: .shipped1)
        secondVC.buttonText = "Next"
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        thirdVC.imageToShow =  UIImage(resource: .medal1)
        thirdVC.buttonText = "Next"
        
        let fourthVC = OnboardingPartViewController()
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        fourthVC.imageToShow =  UIImage(resource: .creditCard1)
        fourthVC.buttonText = "Cool!"
    
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        return viewController
    }
    
    // MARK: - MainFlow
    static func makeMainFlow(appCoordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 2)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        appCoordinator.addChildCoordinator(homeCoordinator)
        appCoordinator.addChildCoordinator(orderCoordinator)
        appCoordinator.addChildCoordinator(listCoordinator)
        appCoordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        return tabBarController
    }
    
    static func makeAuthScene(coordinator: AppCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let vc = LoginViewController(viewOutput: presenter, state: .initial)
        return vc
    }
    
    static func makeSignInScene(coordinator: AppCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let vc = LoginViewController(viewOutput: presenter, state: .signIn)
        return vc
    }
    
    static func makeSignUpScene(coordinator: AppCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let vc = LoginViewController(viewOutput: presenter, state: .signUp)
        return vc
    }
}
