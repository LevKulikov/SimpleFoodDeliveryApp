//
//  ListCoordinator.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 15.04.2024.
//

import UIKit

final class ListCoordinator: Coordinator {
    override func start() {
        let viewController = ViewController()
        viewController.view.backgroundColor = .white
        navigationController.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

