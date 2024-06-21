//
//  FDFoodMenuTitle.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 21.06.2024.
//

import UIKit

class FDFoodMenuTitle: UIView {
    // MARK: - Views
    private let title: UILabel = UILabel()
    private let viewAll: UIButton = UIButton()
    
    // MARK: - Initializers
    init(bigLabel: String) {
        super.init(frame: .zero)
        setupLayout(bigLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FDFoodMenuTitle {
    func setupLayout(_ bigLabel: String) {
        configureView()
        configureTitle(bigLabel)
        configureViewAll()
    }
    func configureView() {
        self.backgroundColor = .clear
    }
    func configureTitle(_ bigLabel: String) {
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .Roboto.bold.size(of: 18)
        title.text = bigLabel
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            title.heightAnchor.constraint(equalToConstant: 22),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 0)
        ])
    }
    func configureViewAll() {
        self.addSubview(viewAll)
        viewAll.translatesAutoresizingMaskIntoConstraints = false
        viewAll.titleLabel?.font = .Roboto.regular.size(of: 12)
        viewAll.setTitle("View all", for: .normal)
        viewAll.setTitleColor(AppColors.black, for: .normal)
        
        NSLayoutConstraint.activate([
            viewAll.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            viewAll.heightAnchor.constraint(equalToConstant: 22),
            viewAll.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        ])
    }
}
