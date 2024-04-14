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
    var navigationController: UINavigationController { get set }
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
    func coordinatorDidFinish(childCoordinator: some CoordinatorProtocol)
}

protocol TabBarCoordinatorProtocol: /*AnyObject,*/ CoordinatorProtocol {
    var tabBarController: UITabBarController? { get set }
}


class Coordinator: CoordinatorProtocol {
    //MARK: Properties
    var childCoordinators: [any CoordinatorProtocol]
    let type: CoordinatorType
    var navigationController: UINavigationController
    var finishDelegate: (any CoordinatorFinishDelegate)?
    
    //MARK: Initializer and deinitializer
    init(childCoordinators: [any CoordinatorProtocol] = [], type: CoordinatorType, navigationController: UINavigationController, finishDelegate: (any CoordinatorFinishDelegate)? = nil) {
        self.childCoordinators = childCoordinators
        self.type = type
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    
    deinit {
        print("Coordinator deinited \(type)")
        childCoordinators.forEach { $0.finishDelegate = nil }
        childCoordinators.removeAll()
    }
    
    //MARK: Methods
    func start() {
        print("Coordinator starts")
    }
    
    func finish() {
        print("Coordinator finishes")
    }
}
