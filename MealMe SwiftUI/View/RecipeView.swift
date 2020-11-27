//
//  MealView.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-09.
//

import SwiftUI

struct RecipeView: View {
    
    @Environment(\.managedObjectContext) private var moc
    
    let selectedRecipe: Recipe?
    let isEditable: Bool
    
    var body: some View {
        VStack {
            Text(selectedRecipe?.name ?? "No Name").hi
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(selectedRecipe: nil, isEditable: true)
    }
}
