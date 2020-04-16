//
//  RecipeForm.swift
//  RecipeBox
//
//  Created by Landon Woerdeman on 4/15/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import SwiftUI

struct RecipeForm: View {
    @Binding var recipes: [Recipe]
    @Binding var id: Int
    
    @State private var name = ""
    @State private var dateMade = Date()
    @State private var isFavorite = false
    @State private var imageName = ""
    @State private var showCaptureImageView: Bool = false
    @State var uiImage: UIImage? = nil
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Form {
                Section(header: Text("Recipe Info")) {
                    TextField("Recipe Name", text: $name)
                    DatePicker("Date Made", selection: $dateMade, in: ...Date(), displayedComponents: .date)
                    Toggle(isOn: $isFavorite) {
                        Text("Favorite?")
                    }
                }
                Section(header: Text("Recipe Picture")) {
                    Button(action: {
                        self.showCaptureImageView.toggle()
                    }) {
                        Text("Add Photo")
                    }
                    uiImage.map {
                        Image(uiImage: $0)
                            .resizable()
                            .scaledToFit()
                    }
                }
                Section {
                    Button(action: {
                        if let filename = self.savePhoto(self.uiImage) {
                            self.imageName = filename }
                        else {
                            self.imageName = "chicken_caprese"
                        }
                        self.recipes.append(Recipe(id: self.id, name: self.name, createdDate: self.dateMade, isFavorite: self.isFavorite, imageName: self.imageName))
                        self.id += 1
                        self.mode.wrappedValue.dismiss()
                    }) {
                        Text("Add Recipe")
                    }
                }
                .disabled(self.name.isEmpty || self.uiImage == nil)
            }
            .navigationBarTitle(Text("New Recipe"))
            if (showCaptureImageView) {
                CaptureImageView(uiImage: $uiImage, isShown: $showCaptureImageView)
            }
        }
    }
    
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
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct RecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        RecipeForm(recipes: .constant([]), id: .constant(0))
    }
}
