//
//  Ad_Lib_StoriesTests.swift
//  Ad-Lib-StoriesTests
//
//  Created by Josh Dunlap on 9/9/23.
//

import XCTest
@testable import Ad_Lib_Stories

class MockBundle: Bundle {
    override func url(forResource name: String?, withExtension ext: String?) -> URL? {
        return self.url(forResource: "MockPuzzles", withExtension: "json")
    }
}

class PuzzleViewModelTests: XCTestCase {
    var viewModel: PuzzleViewModel!
    var mockBundle: MockBundle!

    override func setUpWithError() throws {
        super.setUp()
        mockBundle = MockBundle()
        viewModel = PuzzleViewModel(bundle: mockBundle)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockBundle = nil
        super.tearDown()
    }

    func testLoadPuzzlesSuccess() {
        // When loading puzzles
        viewModel.loadPuzzles()

        // Then there should be puzzles loaded
        XCTAssertFalse(viewModel.puzzles.isEmpty, "Puzzles should be loaded from the mock JSON.")
    }
    
    func testLoadPuzzlesFailure() throws {
            // When loading puzzles
            viewModel.loadPuzzles()

            // Then there should be no puzzles loaded due to the simulated failure
            XCTAssertTrue(viewModel.puzzles.isEmpty, "Puzzles should not be loaded when there is an error.")
        }
}


