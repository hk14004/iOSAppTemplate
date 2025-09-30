//
//  DefaultUserSessionCredentialsStore.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import DevToolsCore
import KeychainAccess
import Foundation
import TemplateApplication


public protocol SwedUserSessionCredentialsStore: UserSessionCredentialsStore where CredentialsType == UserSessionCredentials {}

public class DefaultUserSessionCredentialsStore: SwedUserSessionCredentialsStore {

    // MARK: Properties
    
    private let keychain: Keychain
    
    // MARK: init
    
    public init(keychain: Keychain) {
        self.keychain = keychain
    }
    
    // MARK: Overriden
    
    public func storeCredentials(_ credentials: UserSessionCredentials) {
        guard let data = try? JSONEncoder().encode(credentials) else {
            deleteCredentials(id: credentials.id)
            return
        }
        try? keychain.set(data, key: credentials.id)
    }
    
    public func getCredentials(id: String) -> UserSessionCredentials? {
        guard let data = try? keychain.getData(id) else {
            deleteCredentials(id: id)
            return nil
        }
        let decoded = try? JSONDecoder().decode(UserSessionCredentials.self, from: data)
        return decoded
    }
    
    public func getAllCredentials() -> [UserSessionCredentials] {
        let result: [UserSessionCredentials] = keychain.allKeys().compactMap { credID in
            getCredentials(id: credID)
        }
        return result
    }
    
    public func deleteCredentials(id: String) {
        try? keychain.remove(id)
    }
    
    public func deleteAllCredentials() {
        try? keychain.removeAll()
    }
}
