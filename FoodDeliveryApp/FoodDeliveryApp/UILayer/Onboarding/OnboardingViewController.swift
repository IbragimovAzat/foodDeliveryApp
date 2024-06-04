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
    private var pages = [OnboardingPartViewController]()
    
    
    // MARK: - Views
    var viewOutput: OnboardingViewOutput!
    private lazy var bottomButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = AppColors.grey
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.setTitleColor(AppColors.black, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    init(pages: [OnboardingPartViewController] = [OnboardingPartViewController](), viewOutput: OnboardingViewOutput!) {
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
        setupBottomButton()
    }
}
// MARK: - Actions
private extension OnboardingViewController {
    @objc func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true)
            bottomButton.setTitle(pages[1].buttonText, for: .normal)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true)
            bottomButton.setTitle(pages[2].buttonText, for: .normal)
        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true)
            bottomButton.setTitle(pages[3].buttonText, for: .normal)
        case 3:
            viewOutput.onboardingFinish()
        default:
            break
        }
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
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
    func setupPageViewController() {
        pageViewController.view.backgroundColor = AppColors.accentOrange
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    func setupBottomButton() {
        view.addSubview(bottomButton)
        bottomButton.setTitle(pages[0].buttonText, for: .normal)
        NSLayoutConstraint.activate([
            bottomButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            bottomButton.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -44),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex > 0 else { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex < pages.count - 1 else { return nil }
        return pages[currentIndex + 1]
    }
}
// MARK: - UIPageViewControllerDelegate delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingPartViewController) {
            pageControl.currentPage = index
            let title = pages[index].buttonText
            bottomButton.setTitle(title, for: .normal)
        }
    }
}
