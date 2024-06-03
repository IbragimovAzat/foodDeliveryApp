//
//  OrderCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 01.06.2024.
//

import UIKit

class OrderCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        
    }
}
