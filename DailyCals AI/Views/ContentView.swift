//
//  ContentView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI
import AVFoundation

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .trailing).combined(with: .opacity)
        )
    }
}

struct ContentView: View {
    @Environment(ModelData.self) var modelData
    
    @State var selectedDate = Date.now
    @State var selectedImage: UIImage?
    @State var isAnalysisSheetShowing: Bool = false
    
    let foodByDate: [Date: [Food]] = Dictionary(grouping: ModelData().foods) { food in
        Calendar.current.startOfDay(for: food.createdAt)
    }
    
    let foodCountByDate: [Date: Int] = Dictionary(grouping: ModelData().foods) { food in
        Calendar.current.startOfDay(for: food.createdAt)
    }.mapValues { $0.count }
    
    @State private var isShowingDialog = false
    @State private var isCameraPresented = false
    @State private var isPhotoLibraryPresented = false
    @State private var showCameraDeniedAlert = false
    
    var body: some View {
        VStack {
            Text("DailyCals AI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Spacer()
            
            CalendarView(selectedDate: $selectedDate, foodCountByDate: foodCountByDate)
            
            if let items = foodByDate[selectedDate],
               !items.isEmpty {
                FoodListView(foodItems: items)
                    .offset(y: -55)
                    .transition(.moveAndFade)
            }
            
            Spacer()
            
            Button(action: {
                isShowingDialog = true
            }) {
                VStack {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Circle().stroke(.blue, lineWidth: 2)
                            )
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Text("Add")
                        .font(.headline)
                }
            }
            .confirmationDialog(
                "Select Photo Source",
                isPresented: $isShowingDialog,
                titleVisibility: .visible
            ) {
                Button {
                    // Request camera access before presenting the camera.
                    AVCaptureDevice.requestAccess(for: .video) { granted in
                        DispatchQueue.main.async {
                            if granted {
                                isCameraPresented = true
                            } else {
                                // Trigger an alert if access is denied.
                                showCameraDeniedAlert = true
                            }
                        }
                    }
                } label: {
                    Label("Take Photo", systemImage: "camera")
                }
                
                Button {
                    isPhotoLibraryPresented = true
                } label: {
                    Label("Choose from Library", systemImage: "photo")
                }
                
                Button("Cancel", role: .cancel) {
                    isShowingDialog = false
                }
            }
        }
        .animation(.easeInOut(duration: 0.7), value: selectedDate)
        .onChange(of: selectedImage) {
            isAnalysisSheetShowing = selectedImage != nil
            isCameraPresented = false
            isPhotoLibraryPresented = false
        }
        .fullScreenCover(isPresented: .constant(isAnalysisSheetShowing)) {
            AnalysisView(date: selectedDate, image: selectedImage!, isAnalysisSheetShowing: $isAnalysisSheetShowing)
        }
        .fullScreenCover(isPresented: $isCameraPresented) {
            ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
                .edgesIgnoringSafeArea(.all)
        }
        .fullScreenCover(isPresented: $isPhotoLibraryPresented) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
                .edgesIgnoringSafeArea(.all)
        }
        // Alert for camera access denied.
        .alert(isPresented: $showCameraDeniedAlert) {
            Alert(
                title: Text("Camera Access Denied"),
                message: Text("Please enable camera access in Settings to take photos."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
