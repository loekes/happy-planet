//
//  ListItem.swift
//  Happy Planet WatchKit Extension
//
//  Created by Lukas Raymaekers on 26/04/2020.
//  Copyright © 2020 Lukas Raymaekers. All rights reserved.
//

import SwiftUI

struct PlanetListItem: View {
    let bodyToShow: SpaceBody
    
    var body: some View {
        HStack{
            Image("Happy\(bodyToShow.rawValue)")
                .resizable()
                .padding(.all)
                .frame(width: 64, height: 64)
                .scaledToFill()
            Text("\(bodyToShow.rawValue)")
                .font(.custom("FredokaOne-Regular", size: 20))
            Spacer()
        }
    }
}

struct PlanetListItem_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListItem(bodyToShow: .Moon)
            .previewLayout(.sizeThatFits)
    }
}
