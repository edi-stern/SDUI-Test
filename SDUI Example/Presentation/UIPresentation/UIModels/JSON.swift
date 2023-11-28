//
//  JSON.swift
//  SDUI Example
//
//  Created by Eduard Stern on 28.11.2023.
//

import Foundation

enum DecodingError: Error {
    case dataCorruptedError
}

struct JSON: Decodable {
    var value: Any

    private struct CodingKeys: CodingKey {
        var stringValue: String

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int?

        init?(intValue: Int) {
            self.stringValue = "\(intValue)"
            self.intValue = intValue
        }
    }

    init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            value = try JSON.mapContainerToValue(container)
        } else if let container = try? decoder.singleValueContainer() {
            value = try JSON.decodeSingleValue(container)
        } else {
            throw DecodingError.dataCorruptedError
        }
    }

    private static func mapContainerToValue(_ container: KeyedDecodingContainer<CodingKeys>) throws -> Any {
        var result = [String: Any]()
        for key in container.allKeys {
            result[key.stringValue] = try container.decode(JSON.self, forKey: key).value
        }
        return result
    }

    private static func decodeSingleValue(_ container: SingleValueDecodingContainer) throws -> Any {
        if let stringValue = try? container.decode(String.self) {
            return stringValue
        } else if let intValue = try? container.decode(Int.self) {
            return intValue
        } else if let boolValue = try? container.decode(Bool.self) {
            return boolValue
        } else if let arrayValue = try? container.decode([JSON].self) {
            return arrayValue.map { $0.value }
        } else {
            throw DecodingError.dataCorruptedError
        }
    }
}
