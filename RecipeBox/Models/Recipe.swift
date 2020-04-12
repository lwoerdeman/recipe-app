//
//  Recipe.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/12/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import Foundation
import SwiftUI

class Recipe: ObservableObject {
    @Published var name: String
    @Published var dateCreated: Date
    @Published var image: Image?
    @Published var notes: String?
    @Published var location: String?
    
    init(name: String, dateCreated: Date = Date()) {
        self.name = name
        self.dateCreated = dateCreated
    }
    
    func image(image: Image) -> Recipe {
        self.image = image
        return self
    }
    
    func notes(notes: String) -> Recipe {
        self.notes = notes
        return self
    }
    
    func location(location: String) -> Recipe {
        self.location = location
        return self
    }
}
