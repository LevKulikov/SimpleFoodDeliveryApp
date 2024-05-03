//
//  OnboardingCoordinator.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 14.04.2024.
//
import UIKit

final class OnboardingCoordinator: Coordinator {
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        print("Coordinator Finished")
    }
}

//MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
//        navigationController.pushViewController(viewController, animated: true)
        viewController.modalPresentationStyle = .fullScreen
        navigationController.present(viewController, animated: true)
    }
}
