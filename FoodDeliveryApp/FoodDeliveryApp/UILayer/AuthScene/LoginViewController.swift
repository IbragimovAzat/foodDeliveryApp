//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 06.06.2024.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Views
    private lazy var bottomView = BottomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupActions()
    }
}

private extension LoginViewController {
    func setupLayout() {
        setupBottomView()
    }
    func setupBottomView() {
        self.view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    func setupActions() {
        bottomView.firstButtonTapped = facebookButtonTapped
        bottomView.secondButtonTapped = googleButtonTapped
    }
    func facebookButtonTapped() {
        print("facebook")
    }
    func googleButtonTapped() {
        print("google")
    }
}

#Preview("LoginVC") {
    LoginViewController()
}
