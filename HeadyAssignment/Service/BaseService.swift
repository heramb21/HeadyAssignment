//
//  BaseService.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 08/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond

class BaseService<T>: NSObject {

    var _object = Observable<T?>(nil)

    var client: SafeClient

    var object: SafeSignal<T?> {
        return _object.toSignal()
    }

    required override init() {
        client = SafeClient(wrapping: Client(baseURL: KeychainManager.standard.baseURL))
        super.init()
    }

    convenience init(client: SafeClient) {
        self.init()
        self.client = client
    }

    func update(_ object: T?) {
        _object.value = object
    }
}
