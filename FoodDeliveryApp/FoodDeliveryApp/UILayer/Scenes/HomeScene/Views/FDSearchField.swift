//
//  FDSearchField.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 21.06.2024.
//

import UIKit

class FDSearchField: UITextField {
    // MARK: - Views
    private lazy var paddingView: UIView = {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        return paddingView
    }()
    private lazy var findImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
        imageView.image = UIImage(resource: .loop)
        return imageView
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
        self.font = UIFont.Roboto.regular.size(of: 16)
        self.backgroundColor = AppColors.grey
        self.placeholder = "Search"
        self.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [
            NSAttributedString.Key.foregroundColor: AppColors.black.withAlphaComponent(0.5)
        ])
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20 + 20 + 10, height: 20))
        leftPaddingView.addSubview(findImageView)
        
        self.leftView = leftPaddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
