//
//  PuzzleSelectionView.swift
//  Ad-Lib-Stories
//
//  Created by Josh Dunlap on 9/9/23.
//


import SwiftUI


struct PuzzleSelectionView: View {
    @ObservedObject var viewModel = PuzzleViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.953, green: 0.435, blue: 0.235).ignoresSafeArea() // Set the background color here
                ScrollView {
                    ForEach(viewModel.puzzles) { puzzle in
                        NavigationLink(destination: PuzzleDetailView(puzzle: puzzle)) {
                            Text(puzzle.title)
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
                }
                .navigationTitle("Select a Puzzle")
            }
        }
    }
}

