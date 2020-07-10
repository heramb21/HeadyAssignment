//
//  Category.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 09/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

// MARK: - Category
class Category: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    let products = List<CategoryProduct>()
    let childCategories = List<Int>()

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case products
        case childCategories = "child_categories"
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try (values.decodeIfPresent(Int.self, forKey: .id) ?? 0)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        if let categoryProduct = try? values.decodeIfPresent(CategoryProduct.self, forKey: .products) {
            products.append(categoryProduct)
        }
        if let categoryChild = try? values.decodeIfPresent(Int.self, forKey: .childCategories) {
            childCategories.append(categoryChild)
        }
    }
}
