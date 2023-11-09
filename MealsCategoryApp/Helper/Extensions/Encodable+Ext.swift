//
//  Encodable+Ext.swift
///  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//
import Foundation

extension Encodable {
    func toJSON() -> [String: Any] {
        let encoder = JSONEncoder()
        return (try? JSONSerialization.jsonObject(with: encoder.encode(self), options: .allowFragments)) as? [String: Any] ?? [:]
    }
}
