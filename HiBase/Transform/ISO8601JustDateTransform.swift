//
//  ISO8601Transform.swift
//  HiBase
//
//  Created by 杨建祥 on 2024/5/13.
//

import Foundation
import ObjectMapper


fileprivate extension DateFormatter {
    convenience init(withFormat format: String, timeZone: TimeZone) {
        self.init()
        
        self.timeZone = timeZone
        self.dateFormat = format
    }
}


/// Transforms ISO8601 date string to/from Date. ObjectMapper's `ISO8601DateTransform` actually is date and time transform.
open class ISO8601JustDateTransform: DateFormatterTransform {
    static let reusableISODateFormatter = DateFormatter(withFormat: "yyyy-MM-dd", timeZone: TimeZone(secondsFromGMT: 0)!)
    
    private init() {
        super.init(dateFormatter: ISO8601JustDateTransform.reusableISODateFormatter)
    }
}

// ******************************* MARK: - Singleton

public extension ISO8601JustDateTransform {
    static let shared = ISO8601JustDateTransform()
}
