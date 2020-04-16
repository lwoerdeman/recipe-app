//
//  TestCamera.swift
//  RecipeBoxTests
//
//  Created by Landon Woerdeman on 4/15/20.
//  Copyright © 2020 Landon Woerdeman. All rights reserved.
//

import SwiftUI

struct TestCamera: View {
    @State var uiImage: UIImage? = nil
    @State var showCaptureImageView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    self.showCaptureImageView.toggle()
                }) {
                    Text("Choose photos")
                }
                uiImage.map {
                    Image(uiImage: $0).resizable()
                        .frame(width: 250, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                }
            }
            if (showCaptureImageView) {
                CaptureImageView(uiImage: $uiImage, isShown: $showCaptureImageView)
            }
        }
    }
}

struct TestCamera_Previews: PreviewProvider {
    static var previews: some View {
        TestCamera()
    }
}
