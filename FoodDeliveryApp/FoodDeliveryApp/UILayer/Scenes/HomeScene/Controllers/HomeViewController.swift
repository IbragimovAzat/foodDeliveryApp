//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by Азат Ибрагимов on 17.06.2024.
//

import UIKit

struct Person {
    var name: String
    var gender: String
}

class HomeViewController: UIViewController {

    // MARK: - Properties
    let persons: [Person]? = nil
    // MARK: - Views
    private lazy var searchField: FDSearchField = FDSearchField()
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
        collection.isScrollEnabled = false
        collection.tag = 3
        return collection
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private lazy var geoMarkImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .geoMark)
        return view
    }()
    private lazy var geoLabel: UILabel = {
        let label = UILabel()
        label.text = "9 West 46 Th Street, New York City"
        label.font = UIFont.Roboto.regular.size(of: 12)
        label.textColor = AppColors.black
        label.numberOfLines = .zero
        return label
    }()
    private lazy var foodMenuTitle = FDFoodMenuTitle(bigLabel: "Food Menu")
    private lazy var nearMeTitle = FDFoodMenuTitle(bigLabel: "Near me")
    
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
// MARK: - Layout
extension HomeViewController {
    func setupLayout() {
        setupView()
        prepareScrollView()
        
        configureSearchField()
        
        setupGeoMark()
        setupGeoLabel()
        
        setupfiltersHorizontalCollection()
        
        setupFoodMenuTitle()
        setupFoodMenuCollection()
        
        setupNearMeTitle()
        setupitemVCollection()
        // TODO: Only for mock data
        calculateContentSize()
    }
    func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
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
    func configureSearchField() {
        contentView.addSubview(searchField)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            searchField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            searchField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            searchField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupGeoMark() {
        contentView.addSubview(geoMarkImage)
        geoMarkImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            geoMarkImage.widthAnchor.constraint(equalToConstant: 14),
            geoMarkImage.heightAnchor.constraint(equalToConstant: 20),
            geoMarkImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            geoMarkImage.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10)
        ])
    }
    func setupGeoLabel() {
        contentView.addSubview(geoLabel)
        geoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            geoLabel.leadingAnchor.constraint(equalTo: geoMarkImage.trailingAnchor, constant: 10),
            geoLabel.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 13),
            geoLabel.trailingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 0)
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
            filtersHorizontalCollection.topAnchor.constraint(equalTo: geoMarkImage.bottomAnchor, constant: 30),
            filtersHorizontalCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            filtersHorizontalCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filtersHorizontalCollection.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    
    func setupFoodMenuTitle() {
        contentView.addSubview(foodMenuTitle)
        foodMenuTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodMenuTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            foodMenuTitle.topAnchor.constraint(equalTo: filtersHorizontalCollection.bottomAnchor, constant: 30),
            foodMenuTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            foodMenuTitle.heightAnchor.constraint(equalToConstant: 26)
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
            foodMenuCollection.topAnchor.constraint(equalTo: foodMenuTitle.bottomAnchor, constant: 26),
            foodMenuCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            foodMenuCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodMenuCollection.heightAnchor.constraint(equalToConstant: 130*2+20),
        ])
    }
    
    func setupNearMeTitle() {
        contentView.addSubview(nearMeTitle)
        nearMeTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nearMeTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            nearMeTitle.topAnchor.constraint(equalTo: foodMenuCollection.bottomAnchor, constant: 20),
            nearMeTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            nearMeTitle.heightAnchor.constraint(equalToConstant: 23)
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
            itemVCollection.topAnchor.constraint(equalTo: nearMeTitle.bottomAnchor, constant: 26),
            itemVCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            itemVCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            itemVCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func calculateContentSize() {
        var totalHeight: CGFloat = 500 + 50 + 100 + filtersHorizontalCollection.bounds.height + foodMenuCollection.bounds.height
        
        for index in 0..<itemVCollection.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: index, section: 0)
            let cellHeight = collectionView(itemVCollection, layout: itemVCollection.collectionViewLayout, sizeForItemAt: indexPath).height
            totalHeight += cellHeight
        }
        let spacing = CGFloat(itemVCollection.numberOfItems(inSection: 0) - 1) * 30
        contentView.heightAnchor.constraint(equalToConstant: totalHeight + spacing).isActive = true
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
            return 7
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
