//
//  PuzzleViewModel.swift
//  Ad-Lib-Stories
//
//  Created by Josh Dunlap on 9/9/23.
//

import Foundation


class PuzzleViewModel: ObservableObject {
    @Published var puzzles: [Puzzle] = []
    private var bundle: Bundle

    init(bundle: Bundle = .main) {
        self.bundle = bundle
        loadPuzzles()
    }

    // FIXME: Add error handling for missing puzzle file.
    func loadPuzzles() {
        guard let url = Bundle.main.url(forResource: "puzzles", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Puzzles JSON not found.")
            return
        }

        do {
            let decoder = JSONDecoder()
            self.puzzles = try decoder.decode([Puzzle].self, from: data)
        } catch {
            print("Error decoding puzzles: \(error)")
        }
    }
}

