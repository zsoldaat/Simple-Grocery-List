//
//  VStackStyleExtension.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-16.
//

import SwiftUI

extension View {
    func withCustomStyle() -> some View {
        self.padding(.all)
            .overlay(RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.black, lineWidth: 1)
            )
            .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color.white))
    }
}
