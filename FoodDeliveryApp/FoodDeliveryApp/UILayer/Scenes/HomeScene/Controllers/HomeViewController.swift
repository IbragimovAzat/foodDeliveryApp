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
//        layout.itemSize = CGSize(width: 70, height: 91)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 1
        return collection
    }()
    private lazy var foodMenuCollection: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 2
        return collection
    }()
    private lazy var itemVCollection: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 3
        return collection
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .brown
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemMint
        return view
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
        prepareScrollView()
        setupfiltersHorizontalCollection()
        setupFoodMenuCollection()
        setupitemVCollection()
    }
    func setupView() {
        view.backgroundColor = .white
    }
    func prepareScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    func setupfiltersHorizontalCollection() {
        contentView.addSubview(filtersHorizontalCollection)
        filtersHorizontalCollection.translatesAutoresizingMaskIntoConstraints = false
        filtersHorizontalCollection.backgroundColor = .red
        filtersHorizontalCollection.delegate = self
        filtersHorizontalCollection.dataSource = self
        filtersHorizontalCollection.register(FilterHorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "FilterHorizontalCollectionViewCell")
        
        NSLayoutConstraint.activate([
            filtersHorizontalCollection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            filtersHorizontalCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            filtersHorizontalCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filtersHorizontalCollection.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    func setupFoodMenuCollection() {
        contentView.addSubview(foodMenuCollection)
        foodMenuCollection.translatesAutoresizingMaskIntoConstraints = false
        foodMenuCollection.backgroundColor = .red
        foodMenuCollection.delegate = self
        foodMenuCollection.dataSource = self
        foodMenuCollection.register(FoodMenuCollectionViewCell.self, forCellWithReuseIdentifier: "FoodMenuCollectionViewCell")
        
        NSLayoutConstraint.activate([
            foodMenuCollection.topAnchor.constraint(equalTo: filtersHorizontalCollection.bottomAnchor, constant: 100),
            foodMenuCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            foodMenuCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodMenuCollection.heightAnchor.constraint(equalToConstant: 130*2+20),
        ])
    }
    func setupitemVCollection() {
        contentView.addSubview(itemVCollection)
        itemVCollection.translatesAutoresizingMaskIntoConstraints = false
        itemVCollection.backgroundColor = .red
        itemVCollection.delegate = self
        itemVCollection.dataSource = self
        itemVCollection.register(FoodMenuCollectionViewCell.self, forCellWithReuseIdentifier: "FoodMenuCollectionViewCell")
        
        NSLayoutConstraint.activate([
            itemVCollection.topAnchor.constraint(equalTo: foodMenuCollection.bottomAnchor, constant: 50),
            itemVCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            itemVCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            itemVCollection.heightAnchor.constraint(equalToConstant: 1000),
            itemVCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
// MARK: - filtersCollection delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return 20
        case 2:
            return 10
        case 3:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterHorizontalCollectionViewCell", for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodMenuCollectionViewCell", for: indexPath)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodMenuCollectionViewCell", for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            return CGSize(width: 70, height: 91)
        case 2:
            return CGSize(width: 130, height: 130)
        case 3:
            let width = collectionView.bounds.width
            let height = 130.0
            return CGSize(width: width, height: height)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}
