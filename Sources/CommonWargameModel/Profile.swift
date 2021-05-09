//
//  Profile.swift
//  
//
//  Created by Mario Guerrieri on 5/8/21.
//

import Foundation

public struct Profile<Characteristic: Codable & Hashable>: Codable, Hashable {
    public typealias Characteristic = Characteristic
    
    public init(name: String, characteristics: [Characteristic : Value], points: UInt8) {
        self.name = name
        self.characteristics = characteristics
        self.points = points
    }
    
    public let name: String
    public let characteristics: [Characteristic: Value]
    public let points: UInt8
}
