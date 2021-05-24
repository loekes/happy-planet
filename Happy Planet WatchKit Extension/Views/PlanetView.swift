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
    
    @State private var isShowingOverviewView = false
    @State private var isShowingPlanetChangerView = false
    
    var body: some View {
        let tapOrLongPress = TapGesture(count: 1).onEnded{_ in self.isShowingOverviewView = true
        }.exclusively(before: LongPressGesture(minimumDuration: 1).onEnded{finished in self.isShowingPlanetChangerView = finished
        })
        
        ZStack(alignment: .bottom){
            ZStack{
                Image("Sky")
                   .resizable()
                   .aspectRatio(contentMode:.fill)
                /*NavigationLink(destination: ChooseNewBodyView()){*/
                Button(action: {}, label: {
                    Image("\(conditionState.rawValue)\(bodyToShow.rawValue)")
                        .renderingMode(.original)
                        .gesture(tapOrLongPress)
                })
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
        
        NavigationLink(
            destination: OverviewView(bodyToShow: bodyToShow),
            isActive: $isShowingOverviewView
        ){}.frame(maxHeight: 0).hidden()
        
        NavigationLink(
            destination: ChooseNewBodyView(),
            isActive: $isShowingPlanetChangerView
        ){}.frame(maxHeight: 0).hidden()
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(conditionState: .Sad, bodyToShow: .Moon)
    }
}
