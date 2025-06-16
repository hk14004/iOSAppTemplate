//
//  DefaultUserSessionCredentialsStore.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import DevToolsCore
import KeychainAccess
import Foundation
import ApplicationBusinessRules

class DefaultUserSessionCredentialsStore: BaseUserSessionCredentialsStore<UserSessionCredentials> {

    // MARK: Properties
    
    private let keychain: Keychain
    
    // MARK: init
    
    init(keychain: Keychain) {
        self.keychain = keychain
    }
    
    // MARK: Overriden
    
    override func storeCredentials(_ credentials: UserSessionCredentials) {
        guard let data = try? JSONEncoder().encode(credentials) else {
            deleteCredentials(id: credentials.id)
            return
        }
        try? keychain.set(data, key: credentials.id)
    }
    
    override func getCredentials(id: String) -> UserSessionCredentials? {
        guard let data = try? keychain.getData(id) else {
            deleteCredentials(id: id)
            return nil
        }
        let decoded = try? JSONDecoder().decode(UserSessionCredentials.self, from: data)
        return decoded
    }
    
    override func getAllCredentials() -> [UserSessionCredentials] {
        let result: [UserSessionCredentials] = keychain.allKeys().compactMap { credID in
            getCredentials(id: credID)
        }
        return result
    }
    
    override func deleteCredentials(id: String) {
        try? keychain.remove(id)
    }
    
    override func deleteAllCredentials() {
        try? keychain.removeAll()
    }
}
