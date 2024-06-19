//
//  NearMeCollectionViewCell.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 19.06.2024.
//

import UIKit

class NearMeCollectionViewCell: UICollectionViewCell {
    // MARK: - Views
    let topView = UIView()
    let label = UILabel()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setupCell() {
        contentView.backgroundColor = .blue
        setupTopView()
        setupLabel()
    }
    func setupTopView() {
        contentView.addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .green
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.widthAnchor.constraint(equalToConstant: 130),
            topView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    func setupLabel() {
        contentView.addSubview(label)
        
        label.font = UIFont.Roboto.regular.size(of: 14)
        label.text = "Aboba"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            label.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 15)
        ])
    }
}
