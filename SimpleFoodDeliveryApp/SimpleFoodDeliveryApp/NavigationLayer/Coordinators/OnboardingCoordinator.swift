//
//  OnboardingCoordinator.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 14.04.2024.
//

import Foundation

import UIKit

final class OnboardingCoordinator: Coordinator {
    override func start() {
        let viewController = ViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
