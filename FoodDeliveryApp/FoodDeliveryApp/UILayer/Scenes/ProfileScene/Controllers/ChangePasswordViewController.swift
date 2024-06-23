//
//  ChangePasswordViewController.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 22.06.2024.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    // MARK: - Views
    private lazy var oldPasswordTitle: UILabel = {
        let label = UILabel()
        label.text = "Enter Old Password"
        label.font = UIFont.Roboto.regular.size(of: 14)
        label.textColor = AppColors.lineGrey
        return label
    }()
    private lazy var newPasswordTitle: UILabel = {
        let label = UILabel()
        label.text = "Create New Password"
        label.font = UIFont.Roboto.regular.size(of: 14)
        label.textColor = AppColors.lineGrey
        return label
    }()
    private lazy var passwordField: FDTextField = {
        let field = FDTextField()
        field.placeholder = "Password"
        return field
    }()
    private lazy var newPasswordField: FDTextField = {
        let field = FDTextField()
        field.placeholder = "Enter New Password"
        return field
    }()
    private lazy var reenterPassword: FDTextField = {
        let field = FDTextField()
        field.placeholder = "Re-Enter New Password"
        return field
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        setupNavigationBar()
        setupOldPasswordTitle()
        setupPasswordField()
        setupNewPasswordTitle()
        setupNewPasswordField()
        setupReEnterField()
    }
    func setupNavigationBar() {
        navigationItem.title = "Change password"
        navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(resource: .back), style: .plain, target: nil, action: nil)
    }
    func setupOldPasswordTitle() {
        view.addSubview(oldPasswordTitle)
        oldPasswordTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            oldPasswordTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 159),
            oldPasswordTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            oldPasswordTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    func setupPasswordField() {
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: oldPasswordTitle.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    func setupNewPasswordTitle() {
        view.addSubview(newPasswordTitle)
        newPasswordTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newPasswordTitle.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            newPasswordTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            newPasswordTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    func setupNewPasswordField() {
        view.addSubview(newPasswordField)
        newPasswordField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newPasswordField.topAnchor.constraint(equalTo: newPasswordTitle.bottomAnchor, constant: 20),
            newPasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            newPasswordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    func setupReEnterField() {
        view.addSubview(reenterPassword)
        reenterPassword.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reenterPassword.topAnchor.constraint(equalTo: newPasswordField.bottomAnchor, constant: 20),
            reenterPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            reenterPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}
