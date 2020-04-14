//
//  RecipeRow.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/13/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            recipe.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(recipe.name)
            Spacer()
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: Recipe(id: 0, name: "Chicken Caprese", createdDate: Date(), isFavorite: true, imageName: "chicken_caprese"))
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
