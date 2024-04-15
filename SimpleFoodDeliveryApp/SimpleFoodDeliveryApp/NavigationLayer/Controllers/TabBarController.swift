//
//  TabBarController.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 15.04.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    //MARK: - Properties
    
    //MARK: - Initializer
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for controller in tabBarControllers {
            self.addChild(controller)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("TabBarController init(coder:) has not been implemented")
    }
    
    //MARK: - Lyfe Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = AppColors.background
        tabBar.tintColor = AppColors.accentOrange
    }
    
    //MARK: - Custom methods
    
}
