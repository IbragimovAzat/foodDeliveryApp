//
//  BottomView.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 06.06.2024.
//

import UIKit

class BottomView: UIView {
    // MARK: - Views
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.lineGrey
        label.text = "Or connect with"
        label.font = .Roboto.regular.size(of: 14)
        return label
    }()
    private lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lineGrey.withAlphaComponent(0.3)
        return view
    }()
    private lazy var view2: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "bottomvViewImage")
        return view
    }()
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(firstButtonTrigger), for: .touchUpInside)
        button.setImage(UIImage(named:"facebookImage"), for: .normal)
        return button
    }()
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(secondButtonTrigger), for: .touchUpInside)
        button.setImage(UIImage(named:"google-plusImage"), for: .normal)
        return button
    }()
    // MARK: - Actions
    lazy var firstButtonTapped: (() -> Void)? = {
        
    }
    lazy var secondButtonTapped: (() -> Void)? = {
        
    }
     
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension BottomView {
    // MARK: - Functions
    func setupLayout() {
        self.backgroundColor = .white
        setupLabel()
        setupView1()
        setupView2()
        setupFirstButton()
        setupSecondButton()
    }
    func setupFirstButton() {
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(firstButton)
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
    }
    func setupSecondButton() {
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(secondButton)
        NSLayoutConstraint.activate([
            secondButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            secondButton.leadingAnchor.constraint(equalTo: firstButton.trailingAnchor, constant: 20),
            secondButton.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 20)
        ])
    }
    func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        ])
    }
    func setupView1() {
        self.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view1.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 0),
            view1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -12),
            view1.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    func setupView2() {
        self.addSubview(view2)
        view2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 18),
            view2.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -60),
            view2.heightAnchor.constraint(equalToConstant: 150),
            view2.widthAnchor.constraint(equalToConstant: 282)
        ])
    }
}
extension BottomView {
    @objc func firstButtonTrigger() {
        firstButtonTapped?()
    }
    @objc func secondButtonTrigger() {
        secondButtonTapped?()
    }
}

//#Preview("BottomView", traits: .fixedLayout(width: 400, height: 150)) {
//    BottomView()
//}
