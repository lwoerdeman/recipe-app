//
//  RecipeForm.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/15/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import SwiftUI

struct RecipeForm: View {
    @State private var name = ""
    @State private var dateMade = Date()
    @State private var isFavorite = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipe Info")) {
                    TextField("Recipe Name", text: $name)
                    DatePicker("Date Made", selection: $dateMade, in: ...Date(), displayedComponents: .date)
                    Toggle(isOn: $isFavorite) {
                        Text("Favorite?")
                    }
                }
            }
            .navigationBarTitle(Text("Registration Form"))
        }
    }
}

struct RecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        RecipeForm()
    }
}
