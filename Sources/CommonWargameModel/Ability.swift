//
//  Ability.swift
//  
//
//  Created by Mario Guerrieri on 5/8/21.
//

import Foundation

public struct Ability<Turn: TurnProtocol, Phase: PhaseProtocol>: Codable, Hashable {
    public init(name: String, text: String, phases: [Phase] = Phase.all, turns: [Turn] = Turn.all) {
        self.name = name
        self.text = text
        self.phases = phases
        self.turns = turns
    }

    public let name: String
    public let text: String
    public let phases: [Phase]
    public let turns: [Turn]
}
