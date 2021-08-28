//
//  Weapon.swift
//  
//
//  Created by Mario Guerrieri on 5/8/21.
//

import Foundation

public protocol WeaponType: Codable, Hashable { }
public protocol WeaponCharacteristic: Codable, Hashable { }

public struct Weapon<Type: WeaponType,
                     Characteristic: WeaponCharacteristic,
                     Turn: TurnProtocol,
                     Phase: PhaseProtocol>: Codable, Hashable {
    public typealias Characteristic = Characteristic
    
    public init(name: String,
                type: Type,
                characteristics: [Characteristic: Value],
                points: Value,
                abilities: [Ability<Turn, Phase>]) {
        self.name = name
        self.type = type
        self.characteristics = characteristics
        self.points = points
        self.abilities = abilities
    }
    
    public let name: String
    public let type: Type
    public let characteristics: [Characteristic: Value]
    public let points: Value?
    public let abilities: [Ability<Turn, Phase>]
}
