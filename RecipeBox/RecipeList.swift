//
//  RecipeList.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/13/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import SwiftUI

struct RecipeList: View {
    static var id = 0;
    @State var recipes: [Recipe] = []
    
    var body: some View {
        NavigationView {
            List{
                ForEach(recipes) {recipe in
                    NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                        RecipeRow(recipe: recipe)
                    }
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
            }
            .navigationBarTitle(Text("Recipes"))
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                self.addRecipe()
            }) {
                Image(systemName: "plus")
            })
        }
    }
    
    private func addRecipe() {
        recipes.append(Recipe(id: RecipeList.id, name: String(format: "Chicken Caprese: %d", RecipeList.id), createdDate: Date(), isFavorite: true, imageName: "chicken_caprese"))
        RecipeList.id += 1
    }
    
    private func onDelete(offsets: IndexSet) {
        recipes.remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        recipes.move(fromOffsets: source, toOffset: destination)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
    }
}
