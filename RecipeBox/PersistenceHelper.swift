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
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
