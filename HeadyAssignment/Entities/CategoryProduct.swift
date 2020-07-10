//
//  CategoryProduct.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 09/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

// MARK: - CategoryProduct
class CategoryProduct: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var dateAdded: String?
    let variants = List<Variant>()
    @objc dynamic var tax: Tax = Tax()

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case dateAdded = "date_added"
        case variants
        case tax
    }

     required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try (values.decodeIfPresent(Int.self, forKey: .id) ?? 0)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        dateAdded = try? values.decodeIfPresent(String.self, forKey: .dateAdded)
        if let variant = try? values.decodeIfPresent(Variant.self, forKey: .variants) {
            variants.append(variant)
        }
        tax = try values.decodeIfPresent(Tax.self, forKey: .tax) ?? Tax()
    }
}
