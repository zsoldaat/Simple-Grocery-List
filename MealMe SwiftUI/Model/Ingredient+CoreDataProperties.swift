//
//  Ingredient+CoreDataProperties.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-09.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var amount: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var recipe: Recipe?

}

extension Ingredient : Identifiable {

}
