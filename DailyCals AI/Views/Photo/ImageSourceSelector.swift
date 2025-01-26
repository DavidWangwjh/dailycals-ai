//
//  ImageSourceSelector.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

struct ImageSourceSelector: View {
    @Binding var selectedImage: UIImage?
    
    @State private var isCameraPresented = false
    @State private var isPhotoLibraryPresented = false
    
    var body: some View {
        HStack {
            Button(action: {
                isCameraPresented = true
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .frame(width: 60, height: 50)
            }
            .padding()

            Button(action: {
                isPhotoLibraryPresented = true
            }) {
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .frame(width: 60, height: 50)
            }
            .padding()
        }
        .fullScreenCover(isPresented: $isCameraPresented) {
            ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
                .edgesIgnoringSafeArea(.all)
        }
        .fullScreenCover(isPresented: $isPhotoLibraryPresented) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
