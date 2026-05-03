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
    
    @Published public var tintColor: String? {
        didSet {
            UserDefaults.standard.set(tintColor, forKey: Parameter.tintColor)
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
        self.tintColor = UserDefaults.standard.string(forKey: Parameter.tintColor)
        self.accessToken = UserDefaults.standard.string(forKey: Parameter.accessToken)
        self.latestVersion = UserDefaults.standard.string(forKey: Parameter.latestVersion)
    }

    public var description: String {
        "isDark: \(self.isDark), tintColor: \(self.tintColor), accessToken: \(self.accessToken), latestVersion: \(self.latestVersion)"
    }
    
}

