//
//  FilteredRecipeListVM.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-23.
//

import Foundation

class FilteredRecipeListVM: ObservableObject {
    
    @Published var sortProperty: Property
    @Published var fetchRequest: FetchRequest<Recipe>
    
    init(sortProperty: Property) {
        
    }
    
    enum Property {
        case name, date, preference
    }
    
    
    
}
