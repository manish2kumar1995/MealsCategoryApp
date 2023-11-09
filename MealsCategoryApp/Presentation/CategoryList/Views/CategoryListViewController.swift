//
//  CategoryListViewController.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import UIKit

fileprivate struct Identifiers {
    static let categoryCollectionCell = "CategoryCollectionCell"
}

class CategoryListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    private var viewModel: CategoryListProtocol
    
    //MARK: Init
    init(viewModel: CategoryListProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.getScreenTitle()
        self.initialSetup()
        self.bindViewModel()
        viewModel.fetchCategoryList()
    }
}

//MARK: Custom Methods
extension CategoryListViewController {
    private func initialSetup(){
        self.navigationItem.backButtonTitle = ""

        self.collectionView.register(UINib(nibName: Identifiers.categoryCollectionCell, bundle: nil), forCellWithReuseIdentifier: Identifiers.categoryCollectionCell)

    }
    
    private func bindViewModel(){
        viewModel.getLoadingState = {[weak self] state in
            switch state{
            case .loading:
                // Show loader
                self?.showLoading()
                break
            case .error:
                // show error
                break
            case .empty:
                //Show empty message
                break
            case .populated:
                self?.hideLoading()
                self?.collectionView.reloadData()
            case .reloadRow:
                // reload particular row
                break
            }
        }
    }
    
    private func showLoading() {
        collectionView.isUserInteractionEnabled = false
        loadingIndicator.startAnimating()
    }

    private func hideLoading() {
        collectionView.isUserInteractionEnabled = true
        loadingIndicator.stopAnimating()
    }
}

//MARK: Collection View delegate datasource
extension CategoryListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getTotalCategoryCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.categoryCollectionCell, for: indexPath) as? CategoryCollectionCell else { return UICollectionViewCell() }
        if let meal = viewModel.fetchParticularMeal(at: indexPath.item) {
            cell.meal = meal
        }
        return cell
    }
    
}

//MARK: Collection View flow layout delegate
extension CategoryListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ( self.collectionView.frame.size.width - 60 ) / 3,height:( self.collectionView.frame.size.width - 60 ) / 3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }
}
