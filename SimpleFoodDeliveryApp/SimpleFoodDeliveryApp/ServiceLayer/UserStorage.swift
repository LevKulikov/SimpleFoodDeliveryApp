//
//  UserStorage.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 30.04.2024.
//

import Foundation

final class UserStorage {
    //MARK: Properties
    static let shared = UserStorage()
    
    var passedOnboarding: Bool {
        get {
            UserDefaults.standard.bool(forKey: "passedOnboarding")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "passedOnboarding")
        }
    }
    
    //MARK: Initializer
    private init() {}
    
    //MARK: Methods
}
