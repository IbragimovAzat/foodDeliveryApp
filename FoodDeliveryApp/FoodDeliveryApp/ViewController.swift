//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 24.05.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var justLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textColor = .white
        label.text = "Aboba"
        label.font = .Roboto.italic.size(of: 40)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func addViews() {
        view.addSubview(justLabel)
    }
    
    private func setupConstraints() {
        justLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            justLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            justLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }

}

