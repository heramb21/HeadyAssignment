//
//  ProductInfo+Networking.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 10/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation

extension ProductInfo {
    public static func fetchAllCategoryList() -> Request<ProductInfo, APIError> {
        return Request(
            path: KeychainManager.standard.baseURL,
            method: .get,
            resource: {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(Date.productDateFormatter)
                return try decoder.decode(ProductInfo.self, from: $0)
        },
            error: APIError.init,
            needsAuthorization: false
        )
     }
}
