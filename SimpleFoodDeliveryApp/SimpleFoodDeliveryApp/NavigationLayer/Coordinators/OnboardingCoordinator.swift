//
//  OnboardingCoordinator.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 14.04.2024.
//
import UIKit

final class OnboardingCoordinator: Coordinator {
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        print("Coordinator Finished")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
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
        
        let presentor = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presentor)
//        navigationController.pushViewController(viewController, animated: true)
        viewController.modalPresentationStyle = .fullScreen
        navigationController.present(viewController, animated: true)
    }
}
