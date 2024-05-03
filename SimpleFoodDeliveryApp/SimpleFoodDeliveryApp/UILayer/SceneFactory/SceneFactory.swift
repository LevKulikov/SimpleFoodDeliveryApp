//
//  SceneFactory.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 01.05.2024.
//

import UIKit


struct SceneFactory {
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [UIViewController]()
        
        let firstVC = OnboardingPartViewController(
            imageName: "chicken-leg 1",
            titleText: "Delicious Food",
            descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        )
        
        let secondVC = OnboardingPartViewController(
            imageName: "shipped 1",
            titleText: "Fast Shipping",
            descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla"
        )
        
        let thirdVC = OnboardingPartViewController(
            imageName: "medal 1",
            titleText: "Certificate Food",
            descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id"
        )
        
        let fourthVC = OnboardingPartViewController(
            imageName: "credit-card 1",
            titleText: "Payment Online",
            descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa"
        )
        fourthVC.buttonText = "Cool!"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presentor = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presentor)
        
        return viewController
    }
    
    static func makeOnboardingFlow(parentCoordinator: Coordinator,
                                   navigationController: UINavigationController,
                                   finishDelegate: some CoordinatorFinishDelegate) -> OnboardingCoordinator {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        parentCoordinator.addChildCoordinator(onboardingCoordinator)
        return onboardingCoordinator
    }
    
    static func makeMainFlow(parentCoordinator: Coordinator, finishDelegate: some CoordinatorFinishDelegate) -> TabBarController {
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "bag"), tag: 1)
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.bullet.clipboard"), tag: 2)
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        parentCoordinator.addChildCoordinators(homeCoordinator, orderCoordinator, listCoordinator, profileCoordinator)
        
        let tabs = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabs)
        
        return tabBarController
    }
}
