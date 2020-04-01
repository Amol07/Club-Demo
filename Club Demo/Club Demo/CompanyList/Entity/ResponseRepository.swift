//
//  ResponseRepository.swift
//  Club Demo
//
//  Created by Amol Prakash on 04/02/20.
//  Copyright © 2020 Amol Prakash. All rights reserved.
//

import Foundation
import RealmSwift

//MARK: -  ResponseRepositoryProtocol
protocol ResponseRepositoryProtocol {
    
    //MARK: - Methods
    func updateResponse<T: MappableProtocol>(_ response: T)
    func delete<T: Storable>(_ response: T)
}
//MARK: -  ResponseRepository
class ResponseRepository : BaseRepository<StorableCompanyModel> {
    
    required init(dbManager: DataManager) {
        super.init(dbManager: dbManager)
    }
}

//MARK: -  ResponseRepositoryProtocol implementation
extension ResponseRepository: ResponseRepositoryProtocol {
    
    func updateResponse<T>(_ response: T) where T : MappableProtocol {
        do { try super.update(object: response.mapToPersistenceObject(), completion: {}) }
        catch { print(error.localizedDescription) }
    }
    
    func delete<T>(_ response: T) where T : Storable {
        do {
            try super.delete(object: response) }
        catch { print(error.localizedDescription) }
    }
}
