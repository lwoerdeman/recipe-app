//
//  CaptureImageView.swift
//  RecipeBoxTests
//
//  Created by Landon Woerdeman on 4/15/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import SwiftUI

struct CaptureImageView: UIViewControllerRepresentable {
    @Binding var uiImage: UIImage?
    @Binding var isShown: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(uiImage: $uiImage, isCoordinatorShown: $isShown)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    typealias UIViewControllerType = UIImagePickerController
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var uiImage: UIImage?
        @Binding var isCoordinatorShown: Bool
        
        init(uiImage: Binding<UIImage?>, isCoordinatorShown: Binding<Bool>) {
            _uiImage = uiImage
            _isCoordinatorShown = isCoordinatorShown
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
            uiImage = unwrapImage
            isCoordinatorShown = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isCoordinatorShown = false
        }
    }
}
