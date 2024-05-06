//
//  AppCoordinator.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 14.04.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    private let factory = SceneFactory.self
    private let userStorage = UserStorage.shared
    
    override func start() {
//        if userStorage.passedOnboarding {
//            showMainFlow()
//        } else {
//            showOnboardingFlow()
//        }
        
        let loginVC = LoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        let onboardingCoordinator = factory.makeOnboardingFlow(parentCoordinator: self,
                                                               navigationController: navigationController,
                                                               finishDelegate: self)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        let tabBarController = factory.makeMainFlow(parentCoordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: some CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            navigationController.dismiss(animated: true)
            navigationController.viewControllers.removeAll()
            
            showMainFlow()
        case .app:
            return
        default:
            navigationController.popToRootViewController(animated: false)
        }
    }
}
