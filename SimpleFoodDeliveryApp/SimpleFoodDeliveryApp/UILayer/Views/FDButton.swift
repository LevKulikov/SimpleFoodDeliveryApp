//
//  FDButton.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 08.05.2024.
//

import UIKit

enum FDButtonColorSchemes {
    case white
    case orange
    case gray
}

final class FDButton: UIView {
    //MARK: Properties
    var buttonAction: (() -> Void)?
    var buttonColorScheme: FDButtonColorSchemes {
        didSet {
            setColorScheme(buttonColorScheme)
        }
    }
    
    //MARK: View Props
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Init and Life Cycle
    init(colorScheme: FDButtonColorSchemes = .white) {
        buttonColorScheme = colorScheme
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("FDButton init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    private func setupLayout() {
        backgroundColor = .clear
        setupButton()
    }
    
    private func setupButton() {
        buttonColorScheme = .white
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    @objc
    private func buttonPressed() {
        buttonAction?()
    }
    
    private func setColorScheme(_ colorCheme: FDButtonColorSchemes) {
        switch colorCheme {
        case .white:
            button.backgroundColor = AppColors.white
            button.setTitleColor(AppColors.accentOrange, for: .normal)
        case .orange:
            button.backgroundColor = AppColors.accentOrange
            button.setTitleColor(AppColors.white, for: .normal)
        case .gray:
            button.backgroundColor = AppColors.gray
            button.setTitleColor(AppColors.black, for: .normal)
        }
    }
    
    func setTitle(_ title: String?, for state: UIControl.State) {
        button.setTitle(title, for: state)
    }
}
