//
//  ContentView.swift
//  SwiftUI_VerticalCollectionView
//
//  Created by tuhin on 24/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {  // No spacing between the items
                ForEach(0..<10) { i in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(
                            Text("Cell \(i)")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        )
                        .padding()
                        .containerRelativeFrame(.vertical, alignment: .center)
                    
                        .scrollTransition { emptyVisualEffect, scrollTransitionPhase in
                            
                            emptyVisualEffect.offset(x: scrollTransitionPhase.isIdentity ? 0: 50)
                                .opacity(scrollTransitionPhase.isIdentity ? 1: 0)
                                .scaleEffect(scrollTransitionPhase.isIdentity ? 1.0: 0.5)
                        }
                    
                    
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)  // Enable paging behavior
        .edgesIgnoringSafeArea(.all)  // Ignore safe area for full screen coverage
    }
}


#Preview {
    ContentView()
}
