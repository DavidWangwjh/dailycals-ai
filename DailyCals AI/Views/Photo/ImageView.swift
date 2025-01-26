//
//  ImageView.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import SwiftUI

struct ImageView: View {
    var image: UIImage
    
    var body: some View {
        
        VStack {
            HStack {
                Button("Cancel"){
                    
                }
                
                Spacer()
                
                Button("Done"){
                    
                }
            }
            .padding()
            
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 400, maxHeight: 200)
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ImageView(image: UIImage(named: "cheeseburger")!)
}
