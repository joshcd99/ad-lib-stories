//
//  PuzzleDetailView.swift
//  Ad-Lib-Stories
//
//  Created by Josh Dunlap on 9/10/23.
//

import SwiftUI


struct PuzzleDetailView: View {
    let puzzle: Puzzle
    @State private var answers: [Int: String] = [:]
    @State private var showCompletedPuzzle = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 0.953, green: 0.435, blue: 0.235).ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(puzzle.segments.indices, id: \.self) { index in
                                let segment = puzzle.segments[index]
                                if segment.type == "blank", let label = segment.label {
                                    TextField("Enter a \(label)", text: self.binding(for: index))
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(.horizontal)
                                }
                            }
                            Spacer(minLength: geometry.safeAreaInsets.bottom + 50) // Extra space for button and counter
                        }
                    }
                    
                    Button("Complete Puzzle") {
                        self.showCompletedPuzzle = true
                    }
                    .disabled(!allBlanksFilled())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(allBlanksFilled() ? Color(red: 0.298, green: 0.459, blue: 0.635) : Color(red: 0.753, green: 0.335, blue: 0.135))
                    .foregroundColor(allBlanksFilled() ? Color.white : Color(red: 0.3, green: 0.3, blue: 0.3))
                    .edgesIgnoringSafeArea(.bottom)
                    
                    Text("\(blanksLeftToFill()) blanks left to fill")
                        .foregroundColor(.black)
                        .padding(.bottom, 8)
                }
            }
        }
        .navigationTitle(puzzle.title)
        .sheet(isPresented: $showCompletedPuzzle) {
            CompletedPuzzleView(puzzle: self.puzzle, answers: self.answers)
        }
    }

    private func binding(for index: Int) -> Binding<String> {
        return .init(
            get: { self.answers[index, default: ""] },
            set: { self.answers[index] = $0 }
        )
    }

    private func allBlanksFilled() -> Bool {
        blanksLeftToFill() == 0
    }

    private func blanksLeftToFill() -> Int {
        let blanks = puzzle.segments.enumerated().filter { (index, segment) -> Bool in
            return segment.type == "blank" && answers[index, default: ""].isEmpty
        }
        return blanks.count
    }
}
