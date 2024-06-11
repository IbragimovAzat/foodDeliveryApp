//
//  FDTextField.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 10.06.2024.
//

import UIKit

class FDTextField: UITextField {
    // MARK: - Views
    private lazy var paddingView: UIView = {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        return paddingView
    }()
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.layer.cornerRadius = 24
        self.font = UIFont.Roboto.regular.size(of: 14)
        self.backgroundColor = AppColors.grey
        self.placeholder = "Text to input"
        
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
