//
//  Value.swift
//  Datasheet Viewer
//
//  Created by Mario Guerrieri on 5/8/21.
//

import Foundation

public enum Value: Hashable {
    case fixed(value: UInt8)
    case random(dice: UInt8, size: UInt8)
}

extension Value: Codable {
    enum CodingKeys: CodingKey {
        case fixed
        case randomDice
        case randomSize
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let fixedValue = try? container.decode(UInt8.self, forKey: .fixed) {
            self = .fixed(value: fixedValue)
        } else if let dice = try? container.decode(UInt8.self, forKey: .randomDice),
                  let size = try? container.decode(UInt8.self, forKey: .randomSize) {
            self = .random(dice: dice, size: size)
        } else {
            throw DecodingError.keyNotFound(CodingKeys.fixed,
                                            .init(codingPath: [CodingKeys.fixed],
                                                  debugDescription: "No values for \(Self.self)"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .fixed(value: let value):
                try container.encode(value, forKey: .fixed)
            case .random(dice: let dice, size: let size):
                try container.encode(dice, forKey: .randomDice)
                try container.encode(size, forKey: .randomSize)
        }
    }
}

extension Value: CustomStringConvertible {
    public var description: String {
        switch self {
            case .fixed(value: let value):
                return "\(value)"
            case .random(dice: let dice, size: let size):
                return "\(dice > 1 ? "\(dice)" : "")D\(size)"
        }
    }
}

extension Value: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt8) {
        self = .fixed(value: value)
    }
}
