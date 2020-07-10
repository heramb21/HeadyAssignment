//
//  RankingProduct.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 09/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

// MARK: - RankingProduct
class RankingProduct: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var viewCount: Int = 0
    @objc dynamic var orderCount: Int = 0
    @objc dynamic var shares: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case id
        case viewCount = "view_count"
        case orderCount = "order_count"
        case shares
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try (values.decodeIfPresent(Int.self, forKey: .id) ?? 0)
        viewCount = try (values.decodeIfPresent(Int.self, forKey: .viewCount) ?? 0)
        orderCount = try (values.decodeIfPresent(Int.self, forKey: .orderCount) ?? 0)
        shares = try (values.decodeIfPresent(Int.self, forKey: .shares) ?? 0)
    }
}
