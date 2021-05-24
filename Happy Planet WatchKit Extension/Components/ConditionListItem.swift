//
//  ConditionListItem.swift
//  Happy Planet WatchKit Extension
//
//  Created by Lukas Raymaekers on 27/04/2020.
//  Copyright © 2020 Lukas Raymaekers. All rights reserved.
//

import SwiftUI

struct ConditionListItem: View {
    
    let conditionState: ConditionState
    let bodyToShow: SpaceBody
    let title: String
    
    var body: some View {
        HStack{
            Image("\(conditionState)\(bodyToShow)")
            .resizable()
            .frame(width: 40, height: 40)
            .scaledToFill()
            .padding(.all)
            
            Text("\(title)")
            .font(.custom("FredokaOne-Regular", size: 14))
            Spacer()
        }
    }
}

struct ConditionListItem_Previews: PreviewProvider {
    static var previews: some View {
        ConditionListItem(conditionState: .Happy, bodyToShow: .Moon, title: "Cloud Coverage")
            .previewLayout(.sizeThatFits)
    }
}
