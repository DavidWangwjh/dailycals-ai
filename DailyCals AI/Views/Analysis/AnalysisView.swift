//
//  AnalysisView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

struct AnalysisView: View {
    @Environment(ModelData.self) var modelData
    
    var date: Date
    var image: UIImage
    @State private var isAnalyzing: Bool = false
    @State private var analysisResult: Food?
    
    @Binding var isAnalysisSheetShowing: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Button {
                    isAnalysisSheetShowing = false
                } label: {
                    Text("Cancel")
                }

                Spacer()
                
//                Text(date, format: .dateTime.day().month().year())
//                    .font(.system(size: 24, weight: .bold))
//                    .foregroundStyle(.gray)
//                
//                Spacer()

                Button {
                    isAnalysisSheetShowing = false
                } label: {
                    Text("Done")
                }
            }
            .padding()
            
            Text(date, format: .dateTime.weekday().day().month().year())
                .font(.title2)
                .fontWeight(.bold)
            
            Divider()
            
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .cornerRadius(10) // Add rounded corners
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 8)
                )
                .shadow(color: .gray, radius: 5)
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
                    }
                    // testing
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        isAnalyzing = false
                        analysisResult = modelData.foods[0]
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
    AnalysisView(date: Date(), image: UIImage(named: "cheeseburger")!, isAnalysisSheetShowing: .constant(true))
        .environment(ModelData())
}
