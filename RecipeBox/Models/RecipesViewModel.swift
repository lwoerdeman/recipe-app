//
//  RecipesViewModel.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/18/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import Foundation

fileprivate let decoder = JSONDecoder()
fileprivate let encoder = JSONEncoder()

class RecipesViewModel : ObservableObject {
    @Published var recipes: [Recipe] {
        didSet {
            if let encoded = try? encoder.encode(recipes) {
                UserDefaults.standard.set(encoded, forKey: "recipes")
            }
        }
    }
    
    @Published var recipeIndex: Int = UserDefaults.standard.integer(forKey: "recipeIndex") {
        didSet {
            UserDefaults.standard.set(self.recipeIndex, forKey: "recipeIndex")
        }
    }
    
    init() {
        recipes = loadRecipes()
    }
}

func loadRecipes() -> [Recipe] {
    if let savedRecipes = UserDefaults.standard.data(forKey: "recipes") {
        if let loadedRecipes = try? decoder.decode([Recipe].self, from: savedRecipes) {
            return loadedRecipes
        }
    }
    return []
}
