//
//  ProductInfo.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 09/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ProductInfo: Object, Decodable  {
    let categories = List<Category>()
    let rankings = List<Ranking>()

    enum CodingKeys: String, CodingKey {
        case categories
        case rankings
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let category = try? values.decodeIfPresent(Category.self, forKey: .categories) {
            categories.append(category)
        }
        if let ranking = try? values.decodeIfPresent(Ranking.self, forKey: .rankings) {
            rankings.append(ranking)
        }
    }
}
