//
//  BottomView.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 03.05.2024.
//

import UIKit

final class BottomView: UIView {
    //MARK: Properties
    var button1Action: (() -> Void)?
    var button2Action: (() -> Void)?
    
    //MARK: View Properties
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or connect with"
        label.font = .Roboto.regular.size(of: 14)
        label.textColor = AppColors.bottomViewGray
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.bottomViewGray.withAlphaComponent(0.3)
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "BottomViewImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "google-plus"), for: .normal)
        button.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Init and Life Cycle
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("BottomView init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    private func setupLayout() {
        backgroundColor = .clear
        setupLabel()
        setupLineView()
        setupImageView()
        setupButton1()
        setupButton2()
    }
    
    private func setupLabel() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
    
    private func setupLineView() {
        addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -12),
            lineView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    private func setupImageView() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 18),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -60),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 282)
        ])
    }
    
    private func setupButton1() {
        addSubview(button1)
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            button1.widthAnchor.constraint(equalToConstant: 40),
            button1.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupButton2() {
        addSubview(button2)
        NSLayoutConstraint.activate([
            button2.trailingAnchor.constraint(equalTo: button1.leadingAnchor, constant: -20),
            button2.centerYAnchor.constraint(equalTo: button1.centerYAnchor),
            button2.widthAnchor.constraint(equalTo: button1.widthAnchor),
            button2.heightAnchor.constraint(equalTo: button1.heightAnchor),
        ])
    }
}

//MARK: - Actions
private extension BottomView {
    @objc
    func button1Pressed() {
        button1Action?()
    }
    
    @objc
    func button2Pressed() {
        button2Action?()
    }
}

#Preview("BottomView", traits: .fixedLayout(width: 400, height: 150)) {
    BottomView()
}
