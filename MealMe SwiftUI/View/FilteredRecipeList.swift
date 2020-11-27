//
//  FilteredRecipeList.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-16.
//

import SwiftUI
import CoreData

struct FilteredRecipeList: View {
    
    @Environment(\.managedObjectContext) var moc
    
    init(property: Property) {
        if property == Property.date {
            fetchRequest = FetchRequest(entity: Recipe.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.date, ascending: false)],animation: .default)
        } else if property == Property.name {
            fetchRequest = FetchRequest(entity: Recipe.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.name, ascending: true)],animation: .default)
        } else {
            fetchRequest = FetchRequest(entity: Recipe.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.preference, ascending: false)],animation: .default)
        }
    }
    
    var fetchRequest: FetchRequest<Recipe>
    
    var body: some View {
        List {
            ForEach(fetchRequest.wrappedValue) { recipe in
                NavigationLink(
                    destination: RecipeView(selectedRecipe: recipe, isEditable: false),
                    label: {
                        HStack {
                            Text(recipe.wrappedName)
                            Spacer()
                            RatingDisplayView(sliderValue: .constant(recipe.preference))
                        }
                        
                    })
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(InsetGroupedListStyle())
    }
    
    enum Property {
        case name, date, preference
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { fetchRequest.wrappedValue[$0] }.forEach(moc.delete)

            do {
                try moc.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct FilteredRecipeList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredRecipeList(property: .name)
    }
}
