//
//  Presenter.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 12.02.2023.
//

import Foundation

/// Протокол, через который Interactor общается с Presenter
protocol PresentationLogic: AnyObject {
    func presentFetchedDirections(_ response: DataFlow.FetchDirections.Response)
}

final class Presenter: PresentationLogic {
    weak var viewController: DisplaysLogic?
    
    func presentFetchedDirections(_ response: DataFlow.FetchDirections.Response) {
        viewController?.displayFetchedDirections(.init(directions: response.directions))
    }
}
