//
//  RealmError.swift
//  Club Demo
//
//  Created by Amol Prakash on 03/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.

import Foundation

enum RealmError: Error {
    case eitherRealmIsNilOrNotRealmSpecificModel
}

extension RealmError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .eitherRealmIsNilOrNotRealmSpecificModel:
            return NSLocalizedString("eitherRealmIsNilOrNotRealmSpecificModel", comment: "eitherRealmIsNilOrNotRealmSpecificModel")
        }
    }
}
