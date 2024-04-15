//
//  AppCoordinator.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 14.04.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    override func start() {
//        showOnboardingFlow()
        showMainFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "bag"), tag: 1)
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.bullet.clipboard"), tag: 2)
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinators(homeCoordinator, orderCoordinator, listCoordinator, profileCoordinator)
        
        let tabs = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabs)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: some CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController.popToRootViewController(animated: false)
        }
    }
}
