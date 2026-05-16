//
//  Appdata.swift
//  HiBase
//
//  Created by 杨建祥 on 5/4/26.
//

import Foundation

final public class Appdata: CustomStringConvertible {
    
    public var isDark: Bool {
        didSet {
            UserDefaults.standard.set(isDark, forKey: Parameter.dataIsDark)
        }
    }
    
    public var tintColor: String? {
        didSet {
            UserDefaults.standard.set(tintColor, forKey: Parameter.dataTintColor)
        }
    }
    
    public var latestVersion: String? {
        didSet {
            UserDefaults.standard.set(latestVersion, forKey: Parameter.dataLatestVersion)
        }
    }
    
    public var userId: String? {
        didSet {
            UserDefaults.standard.set(userId, forKey: Parameter.dataUserId)
        }
    }
    
    public var userName: String? {
        didSet {
            UserDefaults.standard.set(userName, forKey: Parameter.dataUserName)
        }
    }
    
    public var accessToken: String? {
        didSet {
            UserDefaults.standard.set(accessToken, forKey: Parameter.dataAccessToken)
        }
    }
    
    public var alreadyLoggedIn: Bool { !(self.accessToken?.isEmpty ?? true) }
    
    public static var shared = Appdata()
    
    public init() {
        self.isDark = UserDefaults.standard.bool(forKey: Parameter.dataIsDark)
        self.tintColor = UserDefaults.standard.string(forKey: Parameter.dataTintColor)
        self.latestVersion = UserDefaults.standard.string(forKey: Parameter.dataLatestVersion)
        self.userId = UserDefaults.standard.string(forKey: Parameter.dataUserId)
        self.userName = UserDefaults.standard.string(forKey: Parameter.dataUserName)
        self.accessToken = UserDefaults.standard.string(forKey: Parameter.dataAccessToken)
    }

    public var description: String {
        "isDark: \(self.isDark), tintColor: \(self.tintColor), accessToken: \(self.accessToken), latestVersion: \(self.latestVersion)"
    }
    
}

