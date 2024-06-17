//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 17.06.2024.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Views
    private lazy var filtersHorizontalCollection: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 70, height: 91)
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}
// MARK: - Layout
extension HomeViewController {
    func setupLayout() {
        setupView()
        setupfiltersHorizontalCollection()
    }
    func setupView() {
        view.backgroundColor = .white
    }
    func setupfiltersHorizontalCollection() {
        view.addSubview(filtersHorizontalCollection)
        filtersHorizontalCollection.translatesAutoresizingMaskIntoConstraints = false
        filtersHorizontalCollection.backgroundColor = .red
        filtersHorizontalCollection.delegate = self
        filtersHorizontalCollection.dataSource = self
        filtersHorizontalCollection.register(FilterHorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "FilterHorizontalCollectionViewCell")
        
        NSLayoutConstraint.activate([
            filtersHorizontalCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            filtersHorizontalCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            filtersHorizontalCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filtersHorizontalCollection.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
}
// MARK: - filtersCollection delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterHorizontalCollectionViewCell", for: indexPath)
        return cell
    }
    
}
