//
//  Weapon.swift
//  
//
//  Created by Mario Guerrieri on 5/8/21.
//

import Foundation

public protocol WeaponType: Codable, Hashable { }
public protocol WeaponCharacteristic: Codable, Hashable { }
public protocol WeaponRange: Codable, CustomStringConvertible, ExpressibleByIntegerLiteral, Hashable { }

public struct Weapon<Type: WeaponType,
                     Characteristic: WeaponCharacteristic,
                     Range: WeaponRange,
                     Turn: TurnProtocol,
                     Phase: PhaseProtocol>: Codable, Hashable {
    public typealias Characteristic = Characteristic
    
    public init(name: String,
                  type: Type,
                  range: Range,
                  characteristics: [Characteristic: Value],
                  damage: Value,
                  points: Value,
                  abilities: [Ability<Turn, Phase>]) {
        self.name = name
        self.type = type
        self.range = range
        self.characteristics = characteristics
        self.damage = damage
        self.points = points
        self.abilities = abilities
    }
    
    public let name: String
    public let type: Type
    public let range: Range
    public let characteristics: [Characteristic: Value]
    public let damage: Value
    public let points: Value
    public let abilities: [Ability<Turn, Phase>]
}
