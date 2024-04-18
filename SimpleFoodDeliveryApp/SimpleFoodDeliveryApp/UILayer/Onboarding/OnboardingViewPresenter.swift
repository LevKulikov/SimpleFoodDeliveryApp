//
//  OnboardingViewPresenter.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 19.04.2024.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinished()
}

final class OnboardingViewPresenter: OnboardingViewOutput {
    //MARK: - Properties
    private weak var coordinator: OnboardingCoordinator!
    
    //MARK: - Init
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Methods
    func onboardingFinished() {
        coordinator.finish()
    }
}
