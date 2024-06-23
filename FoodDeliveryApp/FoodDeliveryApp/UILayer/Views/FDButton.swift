//
//  FDButton.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 08.06.2024.
//

import UIKit

enum FDButtonColorSchemes {
    case white
    case orange
    case grey
    case onboardingWhite
}

class FDButton: UIButton {
    var buttonScheme: FDButtonColorSchemes = .onboardingWhite {
        didSet {
            setColorScheme(scheme: buttonScheme)
        }
    }
    var buttonAction: (() -> Void)?
    
    // MARK: - Initializers
    init(color: FDButtonColorSchemes = .white) {
        super.init(frame: .zero)
        self.layer.cornerRadius = 20
        self.titleLabel?.font = .Roboto.bold.size(of: 18)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setColorScheme(scheme: color)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions
extension FDButton {
    @objc func buttonTapped() {
        buttonAction?()
    }
    func setColorScheme(scheme: FDButtonColorSchemes) {
        switch scheme {
            case .white:
                self.setTitleColor(AppColors.white, for: .normal)
                self.backgroundColor = AppColors.accentOrange
            case .orange:
                self.setTitleColor(AppColors.accentOrange, for: .normal)
                self.backgroundColor = AppColors.white
            case .grey:
                self.setTitleColor(AppColors.black, for: .normal)
                self.backgroundColor = AppColors.grey
            case .onboardingWhite:
                self.setTitleColor(AppColors.black, for: .normal)
                self.backgroundColor = AppColors.white
        }
    }
}
