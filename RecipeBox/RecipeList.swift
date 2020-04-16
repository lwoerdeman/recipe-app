//
//  RecipeList.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/13/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import SwiftUI

struct RecipeList: View {
    @State var id = 0;
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
                trailing: NavigationLink(destination: RecipeForm(recipes: $recipes, id: $id)) {
                        Image(systemName: "plus")
                    })
        }
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
