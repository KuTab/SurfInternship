//
//  DataStore.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 12.02.2023.
//

import Foundation

public protocol DataStoring {
    associatedtype Model
    
    func getValue() -> Model?
    
    func setValue(newValue: Model)
}

final class DataStore<Model>: DataStoring {
    private var model: Model?
    
    func getValue() -> Model? {
        return self.model
    }
    
    func setValue(newValue: Model) {
        self.model = newValue
    }
}
