//
//  RealmProvider.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.

import Foundation
import RealmSwift

//MARK: - RealmProvider
struct RealmProvider {
    
    //MARK: - Stored Properties
    private let configuration: Realm.Configuration
    
    //MARK: - Init
    internal init(config: Realm.Configuration) {
        self.configuration = config
    }
    
    //MARK: - Init
    private var realm: Realm? {
        do {
            return try Realm(configuration: self.configuration)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    //MARK: - Configuration
    private static let defaultConfig = Realm.Configuration(schemaVersion: 1)
    private static let mainConfig = Realm.Configuration(
        fileURL:  URL.inDocumentsFolder(fileName: "main.realm"),
        schemaVersion: 1)
    
    
    //MARK: - Realm Instances
    public static var `default`: Realm? = {
        return RealmProvider(config: RealmProvider.defaultConfig).realm
    }()
    
    public static var main: Realm? = {
        return RealmProvider(config: RealmProvider.mainConfig).realm
    }()
}


extension URL {
    // returns an absolute URL to the desired file in documents folder
    static func inDocumentsFolder(fileName: String) -> URL {
        let url = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
            .appendingPathComponent(fileName)
        print(url)
        return url
    }
}
