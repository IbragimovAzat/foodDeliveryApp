//
//  ProfileListButton.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 22.06.2024.
//

import UIKit

class ProfileListButton: UIView {
    // MARK: Properties
    lazy var actionRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(setupAction))
    var buttonAction: (() -> Void)?
    // MARK: Views
    private lazy var labelButton: UILabel = {
        let button = UILabel()
        button.font = UIFont.Roboto.regular.size(of: 14)
        return button
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .rightArrow)
        return imageView
    }()
    
    // MARK: Initializers
    init(text: String) {
        super.init(frame: .zero)
        setupLayout(text: text)
        setupGestureRecognizer()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Layout
private extension ProfileListButton {
    func setupGestureRecognizer() {
        actionRecognizer.numberOfTapsRequired = 1
        actionRecognizer.numberOfTouchesRequired = 1
        self.addGestureRecognizer(actionRecognizer)
        self.isUserInteractionEnabled = true
    }
    func setupLayout(text: String) {
        setupLabelButton(text: text)
        setupImageButton()
    }
    func setupLabelButton(text: String) {
        self.addSubview(labelButton)
        labelButton.translatesAutoresizingMaskIntoConstraints = false
        labelButton.text = text
        
        NSLayoutConstraint.activate([
            labelButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            labelButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    func setupImageButton() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    @objc func setupAction() {
        print("Pressed")
        buttonAction?()
    }
}
