//
//  KeychainManager.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 08/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class KeychainManager {

    static let standard = KeychainManager()

    let keychain: KeychainWrapper
    let defaults: UserDefaults

    private init() {
        keychain = KeychainWrapper.standard
        defaults = UserDefaults.standard
    }

    func deleteAll() {
        keychain.removeAllKeys()
        let keys = defaults.dictionaryRepresentation().keys
        print("all keys \(keys)")
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        for key in Array(keys) { defaults.removeObject(forKey: key) }
        defaults.synchronize()
    }
    
    var baseURL: String {
        return "https://stark-spire-93433.herokuapp.com/json"
    }
}
