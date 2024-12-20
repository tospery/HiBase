//
//  StaticString+Base.swift
//  Pods
//
//  Created by 杨建祥 on 2024/12/20.
//

import Foundation
import SwiftUI

public extension StaticString {

    var localizedKey: LocalizedStringKey { .init(self.description) }
    
}
