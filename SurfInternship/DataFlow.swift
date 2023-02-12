//
//  DataFlow.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 12.02.2023.
//

import Foundation

enum DataFlow {
    /// Загружает список направлений
    enum FetchDirections {
        /// Передается от ViewController к Interactor
        struct Request {}
        
        /// Передается от Interactor к Presenter
        struct Response {
            let directions: [DirectionModel]
        }
        
        /// Передается от Presenter к ViewController
        /// ViewController передает во View
        struct ViewModel {
            let directions: [DirectionModel]
        }
    }
}
