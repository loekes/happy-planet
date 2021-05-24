//
//  OverviewView.swift
//  Happy Planet WatchKit Extension
//
//  Created by Lukas Raymaekers on 27/04/2020.
//  Copyright © 2020 Lukas Raymaekers. All rights reserved.
//

import SwiftUI

struct OverviewView: View {
    
    let bodyToShow: SpaceBody
    let conditions = [
        Condition(state: .Happy, title: "Cloud Coverage"),
        Condition(state: .Happy, title: "Temperature"),
        Condition(state: .Neutral, title: "Humidity"),
        Condition(state: .Sad, title: "Air Pressure")
    ]
    
    @ViewBuilder
    var body: some View {
        List(conditions, id: \.title){ condition in
            ConditionListItem(conditionState: condition.state, bodyToShow: self.bodyToShow, title: condition.title)
        }.navigationBarTitle("Go Back")
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(bodyToShow: .Mars)
    }
}
