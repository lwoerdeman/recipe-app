//
//  PersistenceHelper.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/15/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import Foundation
import UIKit

struct PersistenceHelper {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let defaults = UserDefaults.standard
    private let recipesKey = "SavedRecipes"
    private let indexKey = "SavedIndex"

    func savePhoto(_ uiImage: UIImage?) -> String? {
        let filename = UUID().uuidString
        
        if let image = uiImage {
            if let data = image.pngData() {
                let filepath = getDocumentsDirectory().appendingPathComponent(filename)
                try? data.write(to: filepath)
                return filename
            }
        }
        return nil
    }
    
    func loadPhoto(_ fileName: String) -> UIImage? {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
    
    func saveRecipes(recipes: [Recipe]) {
        if let encoded = try? encoder.encode(recipes) {
            self.defaults.set(encoded, forKey: self.recipesKey)
        }
    }
    
    func saveIndex(index: Int) {
        self.defaults.set(index, forKey: self.indexKey)
    }
    
    func loadIndex() -> Int{
        return self.defaults.integer(forKey: self.indexKey)
    }
    
    func loadRecipes() -> [Recipe] {
        if let savedRecipes = defaults.object(forKey: self.recipesKey) as? Data {
            if let loadedRecipes = try? decoder.decode([Recipe].self, from: savedRecipes) {
                return loadedRecipes
            }
        }
        return []
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
