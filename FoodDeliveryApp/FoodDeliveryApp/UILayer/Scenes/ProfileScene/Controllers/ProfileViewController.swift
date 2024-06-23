//
//  ProfileViewController.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 22.06.2024.
//

import UIKit

protocol ProfileViewInput: AnyObject {
    
}

class ProfileViewController: UIViewController {
    // MARK: Properties
    var viewOutput: ProfileViewOutput?
    // MARK: - Views
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .empty)
        return imageView
    }()
    private lazy var profileName: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont.Roboto.bold.size(of: 18)
        return label
    }()
    private lazy var profilePhone: UILabel = {
        let label = UILabel()
        label.text = "+7 123 456 78 90"
        label.font = UIFont.Roboto.regular.size(of: 14)
        return label
    }()
    
    private lazy var profileButtonsVS: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    private lazy var myProfileButton = ProfileListButton(text: "My Profile")
    private lazy var changePasswordButton: ProfileListButton = {
        let button = ProfileListButton(text: "Change Password")
        return button
    }()
    private lazy var paymentSettingsdButton = ProfileListButton(text: "Payment Settings")
    private lazy var myVoucherButton = ProfileListButton(text: "My Voucher")
    private lazy var notificationButton = ProfileListButton(text: "My Voucher")
    private lazy var abousUsButton = ProfileListButton(text: "About Us")
    private lazy var contactUsButton = ProfileListButton(text: "Contact Us")
    private lazy var signoutButton: FDButton = {
        let button = FDButton(color: .grey)
        button.setTitle("Sign out", for: .normal)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    // MARK: - Initializers
    init(viewOutput: ProfileViewOutput) {
        super.init(nibName: nil, bundle: nil)
        self.viewOutput = viewOutput
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Buttons functions
private extension ProfileViewController {
    func changePasswordPressed() {
        print("Pressed")
        let vc = ChangePasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Layout
private extension ProfileViewController {
    func setupLayout() {
        setupView()
        setupProfileImageView()
        setupProfileName()
        setupProfilePhone()
        setupProfileButtonsVS()
        setupSignoutButton()
        setupButtonActions()
    }
    func setupView() {
        view.backgroundColor = .white
    }
    func setupProfileButtonsVS() {
        profileButtonsVS.axis = .vertical
        profileButtonsVS.spacing = 40
        
        profileButtonsVS.addArrangedSubview(myProfileButton)
        profileButtonsVS.addArrangedSubview(changePasswordButton)
        profileButtonsVS.addArrangedSubview(paymentSettingsdButton)
        profileButtonsVS.addArrangedSubview(myVoucherButton)
        profileButtonsVS.addArrangedSubview(notificationButton)
        profileButtonsVS.addArrangedSubview(abousUsButton)
        profileButtonsVS.addArrangedSubview(contactUsButton)
        
        view.addSubview(profileButtonsVS)
        profileButtonsVS.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileButtonsVS.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            profileButtonsVS.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            profileButtonsVS.topAnchor.constraint(equalTo: profilePhone.bottomAnchor, constant: 30)
        ])
    }
    func setupButtonActions() {
        changePasswordButton.buttonAction = { [weak self] in
            print("Pressed")
            self?.changePasswordPressed()
        }
    }
    func setupProfileImageView() {
        view.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45)
        ])
    }
    func setupProfileName() {
        view.addSubview(profileName)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 13),
            profileName.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    func setupProfilePhone() {
        view.addSubview(profilePhone)
        profilePhone.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profilePhone.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 11),
            profilePhone.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    func setupSignoutButton() {
        view.addSubview(signoutButton)
        signoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signoutButton.topAnchor.constraint(equalTo: profileButtonsVS.bottomAnchor, constant: 71),
            signoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ProfileViewController: ProfileViewInput {
    
}
//#Preview("ProfileViewController") {
//    ProfileViewController()
//}
