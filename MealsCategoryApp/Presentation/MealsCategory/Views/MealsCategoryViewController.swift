//
//  MealsCategoryViewController.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import UIKit

fileprivate struct Identifiers {
    static let categoriesListTableCell = "CategoriesListTableCell"
}

class MealsCategoryViewController: UIViewController {
    
    @IBOutlet weak var mealsTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    private var viewModel: MealsListProtocol
    
    //MARK: Init
    init(viewModel: MealsListProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.intialSetup()
        self.bindViewModel()
        viewModel.getMealsList()
        // Do any additional setup after loading the view.
    }
}

//MARK: Custom Methods
extension MealsCategoryViewController {
    private func intialSetup() {
        mealsTableView.registerCellNib(cellClass: CategoriesListTableCell.self)
        self.title = "Meals"
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
                self?.mealsTableView.reloadData()
            case .reloadRow(let index):
                let indexPath = IndexPath(item: index, section: 0)
                DispatchQueue.main.async {
                    self?.mealsTableView.beginUpdates()
                    self?.mealsTableView.reloadRows(at: [indexPath], with: .fade)
                    self?.mealsTableView.endUpdates()
                }
            }
        }
    }
    
    private func showLoading() {
        mealsTableView.isUserInteractionEnabled = false
        loadingIndicator.startAnimating()
    }

    private func hideLoading() {
        mealsTableView.isUserInteractionEnabled = true
        loadingIndicator.stopAnimating()
    }
}

//MARK: Custom cell delagate
extension MealsCategoryViewController : CategoriesListTableCellDelegate {
    func didTapOnViewMoreOrLess(at index: Int) {
        viewModel.collapseCell(at: index)
    }
}

//MARK: Table view delegate datasource
extension MealsCategoryViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalMealsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.categoriesListTableCell, for: indexPath) as? CategoriesListTableCell  else { return UITableViewCell() }
        cell.index = indexPath.row
        cell.delegate = self
        if let category = viewModel.fetchParticularMeal(at: indexPath.row) {
            cell.categoryData = category
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let meal = viewModel.fetchParticularMeal(at: indexPath.row){
            let categoryListViewModel = CategoryListViewModel(useCaseProvider: CategoryRespository())
            categoryListViewModel.categoryId = meal.categoryName
            let categoryListViewController = CategoryListViewController(viewModel: categoryListViewModel)
            self.push(viewController: categoryListViewController)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = viewModel.getCellEstimatedHeight(at: indexPath.row) {
            return CGFloat(height)
        } else {
            return  UITableView.automaticDimension
        }
    }
}
