//
//  RecipeList.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/13/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import SwiftUI

struct RecipeList: View {
    var recipes = [Recipe(id: 0, name: "Chicken Caprese", createdDate: Date(), isFavorite: true, imageName: "chicken_caprese")]
    
    var body: some View {
        NavigationView {
            List(recipes) {recipe in
                NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                    RecipeRow(recipe: recipe)
                }
            }
            .navigationBarTitle(Text("Recipes"))
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
