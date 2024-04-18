//
//  OnboardingViewController.swift
//  SimpleFoodDeliveryApp
//
//  Created by Лев Куликов on 19.04.2024.
//

import UIKit

final class OnboardingViewController: UIViewController {
    //MARK: - Properties
    private var pages: [UIViewController] = []
    private let viewOutput: OnboardingViewOutput
    /// Buffer for page index for pageControl to determine which direction page must be scrolled
    private var pageIndexBuffer: Int = 0
    
    //MARK: - Views
    private lazy var pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageVC.delegate = self
        pageVC.dataSource = self
        pageVC.setViewControllers([pages.first ?? UIViewController()], direction: .forward, animated: true)
        return pageVC
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTap), for: .valueChanged)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    //MARK: - Inits
    init(pages: [UIViewController] = [], viewOutput: some OnboardingViewOutput) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("OnboardingViewController init(coder:) has not been implemented")
    }
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        setupPageControl()
    }
    
    //MARK: - Methods
    @objc
    private func pageControlTap() {
        let moveForward: Bool = pageControl.currentPage > pageIndexBuffer
        pageIndexBuffer = pageControl.currentPage
        pageViewController.setViewControllers([pages[pageControl.currentPage]], direction: moveForward ? .forward : .reverse, animated: true)
    }
}

//MARK: - Layout
private extension OnboardingViewController {
    func setupPageViewController() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}

//MARK: - UIPageViewController DataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        pageIndexBuffer = currentIndex - 1
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }
        pageIndexBuffer = currentIndex + 1
        return pages[currentIndex + 1]
    }
}

//MARK: - UIPageViewController Delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let firstPendignVC = pendingViewControllers.first, let index = pages.firstIndex(of: firstPendignVC) {
            pageControl.currentPage = index
        }
    }
}
