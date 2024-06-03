//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 01.06.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        showOnboarding()
    }
    override func finish() {
        print("Onboarding Coordinator finished")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        firstVC.imageToShow =  UIImage(resource: .chickenLeg1)
        
        let secondVC = OnboardingPartViewController()
        secondVC.titleText = "Fast shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.imageToShow =  UIImage(resource: .shipped1)
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        thirdVC.imageToShow =  UIImage(resource: .medal1)
        
        let fourthVC = OnboardingPartViewController()
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        fourthVC.imageToShow =  UIImage(resource: .creditCard1)
    
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
