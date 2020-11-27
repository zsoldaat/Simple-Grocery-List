//
//  IngredientSelectionView.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-11.
//

import SwiftUI

struct NotchedSliderDisplayView: View {
    
    @Binding var displayValue: String
    @State private var sliderValue: Float = 0
    
    var options: [String]
    var displayPosition: Position
    var startIndex: Int? = 0
    var displayWidth: CGFloat? = 50
    
    enum Position {
        case left, right
    }
    
    var body: some View {
        HStack {
            if displayPosition == Position.right {
                Slider(value: $sliderValue, in: 0...Float(options.count-1), step: 1)
                    .onChange(of: sliderValue) { _ in
                        updateDisplayValue()
                    }
                Text(displayValue)
                    .font(.title)
                    .frame(width: displayWidth)
            } else {
                Text(displayValue)
                    .font(.title)
                    .frame(width: displayWidth)
                Slider(value: $sliderValue, in: 0...Float(options.count-1), step: 1)
                    .onChange(of: sliderValue) { value in
                        updateDisplayValue()
                    }
            }
        }
        .onAppear(perform: setup)
    }
    
    func setup() {
        //Set intial slider position
        if (0...options.count-1).contains(startIndex ?? 0) {
            sliderValue = Float(startIndex ?? 0)
        }
        updateDisplayValue()
    }
    
    func updateDisplayValue() {
        displayValue = options[Int(sliderValue)]
    }
}

struct NotchedSliderDisplayView_Previews: PreviewProvider {

    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State var displayValue: String = "0"

        var body: some View {
            NotchedSliderDisplayView(displayValue: $displayValue, options: ["1/16", "1/8","1/6","1/5", "1/4", "1/3", "1/2","2/3","3/4", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"], displayPosition: .right, startIndex: 5)
        }
    }
}

