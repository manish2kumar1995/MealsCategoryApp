//
//  ApiRequest.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import Foundation
import Alamofire

protocol ApiRequest {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}
