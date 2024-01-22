//
//  Puzzle.swift
//  Ad-Lib-Stories
//
//  Created by Josh Dunlap on 9/9/23.
//

import Foundation


struct Segment: Codable, Hashable {
    var type: String
    var content: String?
    var label: String?
}

struct Puzzle: Identifiable {
    var id: String
    var title: String
    var segments: [Segment]
}

extension Puzzle: Codable {
    enum CodingKeys: String, CodingKey {
        case id, title, segments
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        segments = try container.decode([Segment].self, forKey: .segments)
    }
}



