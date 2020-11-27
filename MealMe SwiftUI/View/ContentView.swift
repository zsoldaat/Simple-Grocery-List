//
//  ContentView.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-09.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.name, ascending: true)],
        animation: .default)
    private var recipes: FetchedResults<Recipe>
    
    @State private var recipeViewShowing = false

    var body: some View {
        NavigationView {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(
                        destination: RecipeView(selectedRecipe: recipe, isEditable: false),
                        label: {
                            Text(recipe.name ?? "No name")
                        })
                }
                .onDelete(perform: deleteItems)
            }
            .navigationBarTitle("Recipes")
            .navigationBarItems(trailing: Button(action: { recipeViewShowing = true}) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $recipeViewShowing, content: {
                RecipeView(selectedRecipe: nil, isEditable: true)
            })
        }
    }

    private func addItem() {
        withAnimation {
            let newRecipe = Recipe(context: moc)
            newRecipe.date = Date()

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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { recipes[$0] }.forEach(moc.delete)

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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
