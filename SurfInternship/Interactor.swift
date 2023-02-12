//
//  Interactor.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 12.02.2023.
//

import Foundation

/// Протокол, через который ViewController общается с Interactor
protocol BusinessLogic: AnyObject {
    func fetchDirections(_ request: DataFlow.FetchDirections.Request)
}

final class Interactor: BusinessLogic {
    private let presenter: PresentationLogic
    private let provider: Provides
    
    init(presenter: PresentationLogic, provider: Provides) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func fetchDirections(_ request: DataFlow.FetchDirections.Request) {
        provider.fetchInfo() { [weak presenter] response in
            switch response {
            case let .success(response):
                presenter?.presentFetchedDirections(.init(directions: response))
            case .failure(_):
                return
            }
        }
    }
}
