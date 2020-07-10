//
//  Tax.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 09/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

// MARK: - Tax
class Tax: Object, Decodable {
    @objc dynamic var name: String?
    @objc dynamic var value: Double = 0

    enum CodingKeys: String, CodingKey {
    case name
    case value
    }
    
    required convenience init(from decoder: Decoder) throws {
    self.init()
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try? values.decodeIfPresent(String.self, forKey: .name)
    value = try (values.decodeIfPresent(Double.self, forKey: .value) ?? 0)
    }
}
