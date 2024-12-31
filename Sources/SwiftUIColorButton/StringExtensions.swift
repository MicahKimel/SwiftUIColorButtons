//
//  StringExtensions.swift
//  SwiftUIColorButton
//
//  Created by Micah Kimel on 12/31/24.
//
import Foundation

public extension String {
    func applyPatternOnNumbers(pattern: String, replacementCharacter: Character, _ length: Int) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return String(pureNumber.prefix(length))
    }
    
    
    func toTitleCase() -> String {
        return self.components(separatedBy: " ")
            .map { String($0.prefix(1)).uppercased() + $0.dropFirst().lowercased() }
            .joined(separator: " ")
    }
}
