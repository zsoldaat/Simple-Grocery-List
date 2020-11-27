//
//  RatingDisplayView.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-16.
//

import SwiftUI

struct RatingDisplayView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        Text(toRating(value: sliderValue))
    }
    
    func toRating(value: Double) -> String {
        switch Int(value) {
        case 1:
            return "⭐️"
        case 2:
            return "⭐️⭐️"
        case 3:
            return "⭐️⭐️⭐️"
        case 4:
            return "⭐️⭐️⭐️⭐️"
        case 5:
            return "⭐️⭐️⭐️⭐️⭐️"
        default:
            return "No rating"
        }
    }
}

struct RatingDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        
        @State private var sliderValue: Double = 3.0
        
        var body: some View {
            RatingDisplayView(sliderValue: $sliderValue)
        }
    }
}
