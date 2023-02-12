//
//  DirectionModel.swift
//  SurfInternship
//
//  Created by Egor Dadugin on 12.02.2023.
//

import Foundation

enum PressState {
    case chosen
    case unchosen
}

public struct DirectionModel {
    var title: String
    var pressState: PressState
}
