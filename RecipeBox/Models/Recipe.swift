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
        Image(imageName)
    }
}
