//
//  Variant.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 09/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

// MARK: - Variant
class Variant: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var color: String?
    @objc dynamic var size: Int = 0
    @objc dynamic var price: Int = 0

    enum CodingKeys: String, CodingKey {
       case id
       case color
       case size
       case price
       }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try (values.decodeIfPresent(Int.self, forKey: .id) ?? 0)
        color = try? values.decodeIfPresent(String.self, forKey: .color)
        size = try (values.decodeIfPresent(Int.self, forKey: .size) ?? 0)
        price = try (values.decodeIfPresent(Int.self, forKey: .price) ?? 0)
    }
}
