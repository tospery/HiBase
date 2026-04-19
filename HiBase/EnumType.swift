//
//  Function.swift
//  HiBase
//
//  Created by 杨建祥 on 2024/5/20.
//

import Foundation
import SwifterSwift

enum ASCIICodes {
    static let openCurlyBracket: UInt8 = "{".data(using: .ascii)!.first!
    static let closeCurlyBracket: UInt8 = "}".data(using: .ascii)!.first!
    static let openSquareBracket: UInt8 = "[".data(using: .ascii)!.first!
    static let closeSquareBracket: UInt8 = "]".data(using: .ascii)!.first!
    static let space: UInt8 = " ".data(using: .ascii)!.first!
    static let newLine: UInt8 = "\n".data(using: .ascii)!.first!
}

//public enum Localization: String, Codable, Identifiable, CaseIterable, CustomStringConvertible {
//    
//    case system     = "*"
//    case english    = "en"
//    case chinese    = "zh-Hans"
//    
//    public var id: String { self.rawValue }
//    public var locale: Locale { .init(identifier: self.rawValue) }
//
//    public var description: String {
//        switch self {
//        case .system: NSLocalizedString("Localization.System", value: "System", comment: "")
//        case .english: NSLocalizedString("Localization.English", tableName: "Constant", value: "English", comment: "")
//        case .chinese: NSLocalizedString("Localization.Chinese", tableName: "Constant", value: "中文", comment: "")
//        }
//    }
//    
//}
