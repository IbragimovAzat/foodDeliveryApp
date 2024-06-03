//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 03.06.2024.
//

import UIKit

// MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {

    // MARK: - Properties
    private var pages = [UIViewController]()
    
    
    // MARK: - Views
    weak var viewOutput: OnboardingViewOutput!
    
    init(pages: [UIViewController] = [UIViewController](), viewOutput: OnboardingViewOutput!) {
        super.init(nibName: nil, bundle: nil)
        self.viewOutput = viewOutput
        self.pages = pages
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        return pageViewController
    }()
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .purple
        
        setupPageViewController()
        setupPageControl()
    }
}

// MARK: - Layout
private extension OnboardingViewController {
    func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.numberOfPages = pages.count
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    func setupPageViewController() {
        pageViewController.view.backgroundColor = AppColors.accentOrange
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
}

// MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else { return nil }
        return pages[currentIndex + 1]
    }
}
// MARK: - UIPageViewControllerDelegate delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
            pageControl.currentPage = index
        }
    }
}
