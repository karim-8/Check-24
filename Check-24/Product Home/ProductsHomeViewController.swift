//
//  ProductsHomeViewController.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit

class ProductsHomeViewController: UIViewController {

    
    //MARK:- OUTLETS
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var upperHeaderView: UIView!
    @IBOutlet weak var upperHeaderTitle: UILabel!
    @IBOutlet weak var upperHeaderDescription: UILabel!
    
    //MARK:- PROPERTIES
    var viewModel: ProductsHomeViewModel?
    var coordinator: ProductsHomeCoordinator?
    let searchController = UISearchController()
    let refreshControl = UIRefreshControl()
    var indicatorView = UIView()
    let indicatorHeight : CGFloat = 3
    var selectedIndex = 0
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    var menuTitles: [String]?
    var productsDetails: [Products]?
    var filteredProducts = [Products]()
    var productTypeName = ""
    var headerTitle = "vv"
    var headerSubTitle = "vv?"
        
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionItems()
        setupNavigationBar()
        setupTableViewCell()
        setupNotAvailbleTableViewCell()
        setupCollectionViewCell()
        setViewSwipe()
        setCollectionIndicator()
        initSearchController()
        initRefreshController()
        
    }
    

    
    //MARK:- VIEW WILL APPEAR
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        setupNavigationBar()
    }
    
    //MARK:- SETUP COLLECTION VIEW
    func setupCollectionItems() {
        self.menuCollectionView.reloadData()
        self.menuCollectionView.selectItem(at: self.selectedIndexPath, animated: false, scrollPosition: .centeredVertically)
    }
    
    //MARK:- SETUP TABLE VIEW CELL
    func setupTableViewCell() {
        let nib = UINib(nibName: "ProdHomeTableViewCell", bundle: nil)
        productsTableView.register(nib, forCellReuseIdentifier: "availbleCell")
        productsTableView.separatorColor = .clear
        productsTableView.reloadData()
    }
    
    //MARK:- SETUP TABLE VIEW CELL
    func setupNotAvailbleTableViewCell() {
//        let nib = UINib(nibName: "ProdHomeTableViewCell", bundle: nil)
//        productsTableView.register(nib, forCellReuseIdentifier: "notAvailbleCell")
//        productsTableView.separatorColor = .clear
//        productsTableView.reloadData()
    }
    
    //MARK:- SETUP COLLECTION VIEW CELL
    func setupCollectionViewCell() {
        let nib = UINib(nibName: "MenuBarCollectionViewCell", bundle: nil)
        menuCollectionView.register(nib, forCellWithReuseIdentifier: "MenuBarCollectionViewCell")
        menuCollectionView.reloadData()

    }
    
    //MARK:- SETUP NAVIGATION BAR
    func setupNavigationBar() {
        navigationItem.title = "Products"
        navigationController?.navigationBar.backgroundColor = .gray
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
    //MARK:- INIT SEARCH CONTROLLER
    func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.searchBar.scopeButtonTitles = ["All","Home","Away","sddd"]
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    //MARK:- INIT REFRESH CONTROLLER
    func initRefreshController() {
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        productsTableView.refreshControl = refreshControl
    }
    
    //MARK:- Refresh PULL BUTTON
    @objc func pullToRefresh() {
        productsTableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            self.refreshControl.endRefreshing()
        }
    }
    
    //MARK:- SET COLLECTION INDICATOR
    func setCollectionIndicator() {
        indicatorView.backgroundColor = .lightGray
        
        if let titles = menuTitles {
            indicatorView.frame = CGRect(x: menuCollectionView.bounds.minX, y: menuCollectionView.bounds.maxY - indicatorHeight, width: self.menuCollectionView.bounds.width / CGFloat(titles.count), height: indicatorHeight)
        }
        menuCollectionView.addSubview(indicatorView)
    }
    
    //MARK:- SET SWIPE GESTURE
    func setViewSwipe() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    //MARK:- SWIPE ACTION
    @objc func swipeAction(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .left {
            if let titles = menuTitles {
                if selectedIndex < titles.count - 1 {
                    selectedIndex += 1
                }
            } else {
                if selectedIndex > 0 {
                    selectedIndex -= 1
                }
            }
            selectedIndexPath = IndexPath(item: selectedIndex, section: 0)
            menuCollectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredVertically)
            refreshContent()
        }
    }
    
    //MARK:- REFRESH CONTENT
    func refreshContent(){
        viewModel?.getProductsData(linkType: .ProductUrl)
        let loader = self.loader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            let updatedProducts = self.viewModel?.getProductDetails()
            self.productsDetails = updatedProducts
            let filters = self.viewModel?.getFilters()
            self.menuTitles = filters
            let title = self.viewModel?.headerTitle
            let sub = self.viewModel?.headerSubTitle
            self.headerTitle = title ?? ""
            self.headerSubTitle = sub ?? ""
            self.productsTableView.reloadData()
            self.stopLoader(loader: loader)

            let desiredX = (self.menuCollectionView.bounds.width / CGFloat(self.menuTitles?.count ?? 0)) * CGFloat(self.selectedIndex)
            UIView.animate(withDuration: 0.3) {
                self.indicatorView.frame = CGRect(x: desiredX, y: self.menuCollectionView.bounds.maxY - self.indicatorHeight, width: self.menuCollectionView.bounds.width / CGFloat(self.menuTitles?.count ?? 0), height: self.indicatorHeight)
            }
        }
        self.productsTableView.reloadData()
    }
    
    //MARK:- DEINIT
    deinit {
        viewModel = nil
    }


}
