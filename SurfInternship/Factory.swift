//
//  Factory.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 12.02.2023.
//

import Foundation

public struct Factory {
    public func build() -> InternshipInfoViewController {
        let dataStore = DataStore<[DirectionModel]>()
        let provider = Provider(dataStore: dataStore)
        
        let presenter = Presenter()
        let interactor = Interactor(presenter: presenter, provider: provider)
        let viewController = InternshipInfoViewController(interactor: interactor)
        presenter.viewController = viewController
        
        return viewController
    }
    
    public init() {
        
    }
}
