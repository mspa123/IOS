//
//  FoodInfo.swift
//  Food
//
//  Created by mohammad on 29/03/2024.
//

import SwiftUI

struct FoodInfo: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .bold()
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.bold)
                .italic()
        }
    }
}

struct FoodInfo_Previews: PreviewProvider {
    static var previews: some View {
        FoodInfo(title: "Calories", value: 250)
    }
}
