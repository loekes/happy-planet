//
//  SpaceBodies.swift
//  Happy Planet WatchKit Extension
//
//  Created by Lukas Raymaekers on 26/04/2020.
//  Copyright © 2020 Lukas Raymaekers. All rights reserved.
//

import Foundation

enum ConditionState: String{
    case Happy = "Happy"
    case Neutral = "Neutral"
    case Sad = "Sad"
}

enum SpaceBody: String, CaseIterable{
    case Moon = "Moon"
    case Mars = "Mars"
    case Jupiter = "Jupiter"
    case Neptune = "Neptune"
}

extension SpaceBody: Identifiable {
    var id: String { rawValue }
}
