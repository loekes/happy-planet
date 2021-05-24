//
//  ContentView.swift
//  Happy Planet WatchKit Extension
//
//  Created by Lukas Raymaekers on 25/04/2020.
//  Copyright © 2020 Lukas Raymaekers. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let conditionState: ConditionState = .Happy
    @State var bodyToShow: SpaceBody = SpaceBody(rawValue: defaults.string(forKey: "Body") ?? "Moon") ?? .Moon
    
    @ViewBuilder
    var body: some View {
        PlanetView(conditionState: conditionState, bodyToShow: bodyToShow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
