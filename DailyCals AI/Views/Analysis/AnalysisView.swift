//
//  AnalysisView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

struct AnalysisView: View {
    @Environment(ModelData.self) var modelData
    
    var image: UIImage
    @State private var isAnalyzing: Bool = false
    @State private var analysisResult: Food?
    
    @Binding var isAnalysisSheetShowing: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Button("Cancel"){
                    isAnalysisSheetShowing = false
                }

                Spacer()

                Button("Done"){
                    isAnalysisSheetShowing = false
                }
            }
            .padding(.horizontal)
            
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 8)
                )
                .shadow(color: .gray, radius: 5)
                .frame(maxWidth: 400, maxHeight: 300)
                .padding()
            
            if analysisResult != nil {
                AnalysisResultView(result: analysisResult!)
            } else {
                Button {
                    isAnalyzing = true
                    
                    ImageAnalysisService.analyzeFood(image: image) { result in
//                        DispatchQueue.main.async {
//                            isAnalyzing = false
//                            switch result {
//                            case .success(let analysis):
//                                analysisResult = analysis
//                            case .failure(let error):
//                                print("Analysis error: \(error)")
//                            }
//                        }
                        // testing
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            isAnalyzing = false
                            analysisResult = modelData.food
                        }
                    }
                } label: {
                    if isAnalyzing {
                        Text("Analyzing Image...")
                            .font(.system(size: 22, weight: .bold))
                            .padding(5)
                    } else {
                        Text("Analyze")
                            .font(.system(size: 22, weight: .bold))
                            .padding(5)
                    }
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .disabled(isAnalyzing)
            }
            
            Spacer()
        }
    }
}

#Preview {
    AnalysisView(image: UIImage(named: "cheeseburger")!, isAnalysisSheetShowing: .constant(true))
        .environment(ModelData())
}
