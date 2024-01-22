//
//  CompletedPuzzleView.swift
//  Ad-Lib-Stories
//
//  Created by Josh Dunlap on 9/10/23.
//

import SwiftUI

struct CompletedPuzzleView: View {
    let puzzle: Puzzle
    let answers: [Int: String]
    
    var body: some View {
        ZStack {
            Color(red: 0.953, green: 0.635, blue: 0.435)
                .ignoresSafeArea()
            VStack {
                Text(puzzle.title)
                    .font(.largeTitle)
                Text(completedPuzzleText())
                    .padding()
                    .font(.title2)
            }
        }
    }

    func completedPuzzleText() -> String {
        var text = ""
        
        for (index, segment) in puzzle.segments.enumerated() {
            if segment.type == "fixed" {
                text += segment.content ?? ""
            } else if segment.type == "blank" {
                text += answers[index] ?? ""
            }
        }
        return text
    }

}

