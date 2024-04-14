//
//  Coordinator.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 14.04.2024.
//

import UIKit

enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ newChildCoordinator: CoordinatorProtocol) {
        childCoordinators.append(newChildCoordinator)
    }
    
    func removeChildCoordinator(_ toRemoveChildCoordinator: CoordinatorProtocol) {
//        childCoordinators = childCoordinators.filter { $0 !== toRemoveChildCoordinator }
        childCoordinators.removeAll { $0 === toRemoveChildCoordinator }
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}
