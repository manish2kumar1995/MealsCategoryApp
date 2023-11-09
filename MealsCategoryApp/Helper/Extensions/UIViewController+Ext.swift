//
//  UIViewController+Ext.swift
///  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import UIKit

extension UIViewController {
    
    func setRootViewController(to viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController = navigationController
    }
    
    func push(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
}
