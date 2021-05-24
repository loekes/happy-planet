//
//  ChooseNewBodyView.swift
//  Happy Planet WatchKit Extension
//
//  Created by Lukas Raymaekers on 26/04/2020.
//  Copyright © 2020 Lukas Raymaekers. All rights reserved.
//

import SwiftUI

struct ChooseNewBodyView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        List(SpaceBody.allCases){ spaceBody in
            Button(
                action:  {
                    defaults.set(spaceBody.rawValue, forKey: "Body")
                    self.mode.wrappedValue.dismiss()
                },
                label: {
                    PlanetListItem(bodyToShow: spaceBody)
                }
            )
        }.navigationBarTitle("Go Back")
        
    }
}

struct ChooseNewBodyView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseNewBodyView()
    }
}
