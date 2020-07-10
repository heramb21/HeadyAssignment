//
//  FetchAllCategoryService.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 10/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit
import RealmSwift
import SwiftKeychainWrapper

class FetchAllCategoryService: BaseService<ProductInfo> {

    required init() {
        super.init()
    }

    func fetch() -> SafeSignal<ProductInfo> {
        return ProductInfo.fetchAllCategoryList().response(using: client).debug()
    }
}
