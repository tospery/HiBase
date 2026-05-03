//
//  Appdata.swift
//  HiBase
//
//  Created by 杨建祥 on 5/4/26.
//

import Foundation
import Combine

final public class Appdata: ObservableObject, CustomStringConvertible {
    
    @Published public var isDark: Bool {
        didSet {
            UserDefaults.standard.set(isDark, forKey: Parameter.isDark)
        }
    }
    
    @Published public var accentColor: String? {
        didSet {
            UserDefaults.standard.set(accentColor, forKey: Parameter.accentColor)
        }
    }
    
    @Published public var latestVersion: String? {
        didSet {
            UserDefaults.standard.set(latestVersion, forKey: Parameter.latestVersion)
        }
    }
    
    @Published public var accessToken: String? {
        didSet {
            UserDefaults.standard.set(accessToken, forKey: Parameter.accessToken)
        }
    }
    
    public var alreadyLoggedIn: Bool { !(self.accessToken?.isEmpty ?? true) }
    
    public static var shared = Appdata()
    
    public init() {
        self.isDark = UserDefaults.standard.bool(forKey: Parameter.isDark)
        self.accentColor = UserDefaults.standard.string(forKey: Parameter.accentColor)
        self.accessToken = UserDefaults.standard.string(forKey: Parameter.accessToken)
        self.latestVersion = UserDefaults.standard.string(forKey: Parameter.latestVersion)
    }

    public var description: String {
        "isDark: \(self.isDark), accentColor: \(self.accentColor), accessToken: \(self.accessToken), latestVersion: \(self.latestVersion)"
    }
    
}

