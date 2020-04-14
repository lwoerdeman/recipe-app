//
//  RecipeDetail.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/12/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
            
    let dateFormatter = DateFormatter()
    
    init(recipe: Recipe) {
        self.recipe = recipe
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            recipe.image
                .resizable()
                .frame(height: 500)
            HStack {
                VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title)
                    Text(dateFormatter.string(from: recipe.createdDate))
                    .font(.subheadline)
                }
                Spacer()
            }.padding()
            Text("Notes").font(.headline).padding(.leading)
            Spacer()
        }
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: Recipe(id: 0, name: "Chicken Caprese", createdDate: Date(), isFavorite: true, imageName: "chicken_caprese"))
    }
}
