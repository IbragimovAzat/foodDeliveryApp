//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 01.06.2024.
//

import UIKit

//class ProfileCoordinator: Coordinator {
//    let factory = SceneFactory.self
//    override func start() {
//        let vc = ViewController()
//        vc.view.backgroundColor = .black
//        navigationController?.pushViewController(vc, animated: true)
//    }
//    override func finish() {
//        print("ProfileCoordinator has been finished")
//    }
//}
//// MARK: Navigation
//extension ProfileCoordinator {
//    func showProfileScene() {
//        guard let navigationController = navigationController else { return }
//        let vc = factory.makeProfileScene(coordinator: self)
//        navigationController.pushViewController(vc, animated: true)
//    }
//}

class ProfileCoordinator: Coordinator {
    // MARK: - Properties
    private let factory = SceneFactory.self
    
    override func start() {
        showProfileScene()
    }
    override func finish() {
        print("Profile coordinator has finished")
    }
}
// MARK: - Navigation
extension ProfileCoordinator {
    func showProfileScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeProfileScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}
