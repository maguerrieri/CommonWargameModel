//
//  Phase.swift
//  
//
//  Created by Mario Guerrieri on 5/8/21.
//

import Foundation

public protocol PhaseProtocol: Codable, Hashable, Identifiable {
    static var all: [Self] { get }
}

public extension PhaseProtocol where Self: CaseIterable, Self.AllCases == [Self] {
    static var all: [Self] { return self.allCases }
}
