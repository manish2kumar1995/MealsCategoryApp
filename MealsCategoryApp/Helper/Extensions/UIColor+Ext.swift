//
//  UIColor+Ext.swift
///  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import UIKit

enum Color: String {
    case appThemeBlue = "AppThemeBlue"
    case shadowColor = "AppThemeGray"
}

extension UIColor {
    static func color(for color: Color) -> UIColor {
        UIColor(named: color.rawValue) ?? UIColor()
    }
}
