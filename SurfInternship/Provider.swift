//
//  Provider.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 12.02.2023.
//

import Foundation

/// Протокол, через который Provider общается с Interactor
public protocol Provides: AnyObject {
    func fetchInfo(_ completion: @escaping (Result<[DirectionModel], Error>) -> Void)
}

final class Provider: Provides {
    
    private var dataStore: DataStore<[DirectionModel]>
    
    init(dataStore: DataStore<[DirectionModel]>) {
        self.dataStore = dataStore
        let internshipDirections: [DirectionModel] = [DirectionModel(title: "iOS", pressState: .unchosen), DirectionModel(title: "Android", pressState: .unchosen), DirectionModel(title: "Design", pressState: .unchosen), DirectionModel(title: "QA", pressState: .unchosen), DirectionModel(title: "Flutter", pressState: .unchosen), DirectionModel(title: "PM", pressState: .unchosen), DirectionModel(title: "Backend", pressState: .unchosen), DirectionModel(title: "Data Science", pressState: .unchosen), DirectionModel(title: "ML", pressState: .unchosen), DirectionModel(title: "Frontend", pressState: .unchosen)]
        dataStore.setValue(newValue: internshipDirections)
    }
    
    func fetchInfo(_ completion: @escaping (Result<[DirectionModel], Error>) -> Void) {
        guard let data = dataStore.getValue() else {
            completion(.failure(URLError(.networkConnectionLost)))
            return
        }
        completion(.success(data))
    }
}
