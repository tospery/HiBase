//
//  Bundle+Base.swift
//  Pods
//
//  Created by 杨建祥 on 2024/12/17.
//

import Foundation

public extension Bundle {

    var name: String { self.displayName ?? self.bundleName }
    var displayName: String? { object(forInfoDictionaryKey: "CFBundleDisplayName") as? String }
    var bundleName: String { infoDictionary?[kCFBundleNameKey as String] as! String }
    var bundleIdentifier: String { infoDictionary?[kCFBundleIdentifierKey as String] as! String }
    var version: String { object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "" }
    var buildNumber: String { object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? "" }
    
    private static var _baseApiUrl: String?
    var baseApiUrl: String {
        if Bundle._baseApiUrl?.isNotEmpty ?? false {
            return Bundle._baseApiUrl!
        }
        let dict = infoDictionary?["HiBaseURLs"] as? [String: String] ?? [:]
        let base = tryString(dict["api"]) ?? ""
        Bundle._baseApiUrl = base.isEmpty ? "https://api.\(self.urlScheme() ?? "app").com" : base
        return Bundle._baseApiUrl!
    }

    private static var _baseWebUrl: String?
    var baseWebUrl: String {
        if Bundle._baseWebUrl?.isNotEmpty ?? false {
            return Bundle._baseWebUrl!
        }
        let dict = infoDictionary?["HiBaseURLs"] as? [String: String] ?? [:]
        let base = tryString(dict["web"]) ?? ""
        Bundle._baseWebUrl = base.isEmpty ? "https://m.\(self.urlScheme() ?? "app").com" : base
        return Bundle._baseWebUrl!
    }
    
    var team: String {
        let query = [
            kSecClass as NSString: kSecClassGenericPassword as NSString,
            kSecAttrAccount as NSString: "bundleSeedID" as NSString,
            kSecAttrService as NSString: "" as NSString,
            kSecReturnAttributes as NSString: kCFBooleanTrue as NSNumber
        ] as NSDictionary
        
        var result: CFTypeRef?
        var status = Int(SecItemCopyMatching(query, &result))
        if status == Int(errSecItemNotFound) {
            status = Int(SecItemAdd(query, &result))
        }
        if status == Int(errSecSuccess),
            let attributes = result as? NSDictionary,
            let accessGroup = attributes[kSecAttrAccessGroup as NSString] as? NSString,
            let bundleSeedID = (accessGroup.components(separatedBy: ".") as NSArray).objectEnumerator().nextObject() as? String {
            return bundleSeedID
        }
        
        return ""
    }

    func urlScheme(name: String = "app") -> String? {
        var scheme: String? = nil
        if let types = Bundle.main.infoDictionary?["CFBundleURLTypes"] as? Array<Dictionary<String, Any>> {
            for info in types {
                if let urlName = info["CFBundleURLName"] as? String,
                   urlName == name {
                    if let urlSchemes = info["CFBundleURLSchemes"] as? [String] {
                        scheme = urlSchemes.first
                    }
                }
            }
        }
        return scheme
    }
    
    
}
