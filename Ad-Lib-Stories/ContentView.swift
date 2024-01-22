//
//  ContentView.swift
//  Fill-in-the-Blank Stories
//
//  Created by Josh Dunlap on 9/9/23.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.953, green: 0.435, blue: 0.235)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                    Spacer()
                    NavigationLink(destination: PuzzleSelectionView()) {
                        Text("Select a puzzle")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.298, green: 0.459, blue: 0.635))
                            .cornerRadius(10)
                            
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct PuzzleView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.757, green: 0.761, blue: 0.741)
                    .ignoresSafeArea()
                VStack {
                    
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
