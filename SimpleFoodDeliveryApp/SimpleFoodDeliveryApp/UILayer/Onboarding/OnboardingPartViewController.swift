//
//  OnboardingPartViewController.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 19.04.2024.
//

import UIKit

final class OnboardingPartViewController: UIViewController {
    //MARK: - Properties
    private let imageName: String
    private let titleText: String
    private let descriptionText: String
    var buttonText = "Next"
    
    //MARK: Views
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark.circle")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = titleText
        label.font = .Roboto.bold.size(of: 24)
        label.textColor = AppColors.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = descriptionText
        label.font = .Roboto.regular.size(of: 14)
        label.textColor = AppColors.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Initializer
    init(imageName: String, titleText: String, descriptionText: String) {
        self.imageName = imageName
        self.titleText = titleText
        self.descriptionText = descriptionText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("OnboardingPartViewController init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = AppColors.accentOrange
    }
    
    //MARK: Methods
}

//MARK: - Layout
private extension OnboardingPartViewController {
    func setupLayout() {
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    func setupImageView() {
        if let image = UIImage(named: imageName) {
            imageView.image = image
        }
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupDescriptionLabel() {
        view.addSubview(descriptionLabel)
        
        let padding: CGFloat = 65
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
}
