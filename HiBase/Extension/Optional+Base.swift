//
//  String+Base.swift
//  HiBase
//
//  Created by 杨建祥 on 2024/5/20.
//

import Foundation
import SwifterSwift

public extension Optional {
    var isNil: Bool { self == nil }
}

extension Optional: OptionalType {
    /// Cast `Optional<Wrapped>` to `Wrapped?`
    public var value: Wrapped? { self }
}
