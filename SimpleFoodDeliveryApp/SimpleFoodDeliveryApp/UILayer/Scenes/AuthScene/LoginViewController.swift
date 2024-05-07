//
//  LoginViewController.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 03.05.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    //MARK: - Properties
    private let bottomView = BottomView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    //MARK: - Methods
    private func facebookPressed() {
        print("Facebook button pressed")
    }
    
    private func googlePressed() {
        print("Google button pressed")
    }
}

//MARK: - Layout
private extension LoginViewController {
    func setupLayout() {
        setupBottomView()
    }
    
    func setupBottomView() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.button1Action = googlePressed
        bottomView.button2Action = facebookPressed
        view.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

//MARK: - Preview
#Preview("LoginVC") {
    LoginViewController()
}
