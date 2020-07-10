//
//  Ranking.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 09/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

// MARK: - Ranking
class Ranking: Object, Decodable {
    @objc dynamic var ranking: String?
    let products = List<RankingProduct>()
    
    enum CodingKeys: String, CodingKey {
        case ranking
        case products
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ranking = try? values.decodeIfPresent(String.self, forKey: .ranking)
        if let rankingProduct = try? values.decodeIfPresent(RankingProduct.self, forKey: .products) {
            products.append(rankingProduct)
        }
    }
}
