//
//  Recipe.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/12/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    let id: Int
    var name: String
    var createdDate: Date
    var isFavorite: Bool
    var imageName: String
}

extension Recipe {
    var image: Image {
        if let image = load(fileName: imageName) {
            return Image(uiImage: image)
        }
        return Image(imageName)
    }
    
    private func load(fileName: String) -> UIImage? {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
