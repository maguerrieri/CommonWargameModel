//
//  Wargear.swift
//  Datasheet Viewer
//
//  Created by Mario Guerrieri on 5/8/21.
//

import Foundation

public struct Wargear<Turn: TurnProtocol, Phase: PhaseProtocol>: Codable, Hashable {
    public init(name: String, text: String, points: UInt8, phases: [Phase] = Phase.all, turns: [Turn] = Turn.all) {
        self.name = name
        self.text = text
        self.points = points
        self.phases = phases
        self.turns = turns
    }

    public let name: String
    public let text: String
    public let points: UInt8
    public let phases: [Phase]
    public let turns: [Turn]
}
