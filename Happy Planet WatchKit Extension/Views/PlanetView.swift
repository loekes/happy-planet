//
//  PlanetView.swift
//  Happy Planet WatchKit Extension
//
//  Created by Lukas Raymaekers on 21/05/2021.
//  Copyright © 2021 Lukas Raymaekers. All rights reserved.
//

import SwiftUI

struct PlanetView: View {
    let conditionState: ConditionState
    @State var bodyToShow: SpaceBody
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack{
                Image("Sky")
                   .resizable()
                   .aspectRatio(contentMode:.fill)
                NavigationLink(destination: ChooseNewBodyView()){
                    Image("\(conditionState.rawValue)\(bodyToShow.rawValue)")
                        .renderingMode(.original)
                }
                .buttonStyle(PlainButtonStyle())
            }
           
            if conditionState == .Happy {
                Text("Good to go!")
                .font(.custom("FredokaOne-Regular", size: 20))
            }
            else if conditionState == .Sad {
                Text("No luck tonight!")
                .font(.custom("FredokaOne-Regular", size: 20))
            }
            else {
                Text("It's up to you!")
                .font(.custom("FredokaOne-Regular", size: 20))
            }
        }
        .navigationBarTitle("Happy Planet")
        .onAppear(perform: {
            self.$bodyToShow.wrappedValue = SpaceBody(rawValue: defaults.string(forKey: "Body") ?? "Moon") ?? .Moon
        })

    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(conditionState: .Sad, bodyToShow: .Moon)
    }
}
