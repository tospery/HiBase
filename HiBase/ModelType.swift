//
//  ModelType.swift
//  HiBase
//
//  Created by 杨建祥 on 2022/7/18.
//

import Foundation
import ObjectMapper
import SwifterSwift

public protocol ModelType: Mappable, Identifiable, Codable, Equatable, CustomStringConvertible, CustomDebugStringConvertible {
    var isValid: Bool { get }
    init()
}

public extension ModelType {

    var isValid: Bool {
        let string = tryString(self.id) ?? ""
        if !string.isEmpty {
            return true
        }
        let int = tryInt(self.id) ?? 0
        if int != 0 {
            return true
        }
        return false
    }
    
    var description: String { self.toJSONString() ?? tryString(self.id) ?? "" }
    
    var debugDescription: String { self.toJSONString() ?? tryString(self.id) ?? "" }
    
    static func == (lhs: Self, rhs: Self) -> Bool { lhs.id == rhs.id }

    public func isEqual(to other: any ModelType) -> Bool {
        guard let otherModel = other as? Self else {
            return false
        }
        return self == otherModel
    }
}

public protocol UserType: ModelType {
    var username: String? { get }
    var nickname: String? { get }
    var avatar: String? { get }
}

public protocol ProfileType: ModelType {
    var localization: Localization? { get set }
    var loginedUser: (any UserType)? { get set }
}

public struct AnyModel: Identifiable, Equatable {
    
    public let base: any ModelType

    public var id: String { tryString(base.id) ?? "" }
    
    public init<Model: ModelType>(_ base: Model) {
        self.base = base
    }

    public static func == (lhs: AnyModel, rhs: AnyModel) -> Bool {
        guard type(of: lhs.base) == type(of: rhs.base) else {
            return false
        }
        return lhs.base.isEqual(to: rhs.base)
    }
}

public struct WrappedModel: ModelType {
    
    public var data: Any
    
    public var id: String { self.description }
    
    public var isValid: Bool { true }
    
    public init() {
        self.data = 0
    }
    
    public init(_ data: Any) {
        self.data = data
    }
    
    public init?(map: Map) {
        self.data = 0
    }
    
    public mutating func mapping(map: Map) {
        data    <- map["data"]
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.description == rhs.description
    }
    
    public var description: String {
        String.init(describing: self.data)
    }

    enum CodingKeys: String, CodingKey {
        case data
    }
    
    public func encode(to encoder: Encoder) throws { throw MappingError.unknownType }

     public init(from decoder: Decoder) throws { throw MappingError.unknownType }
    
}

public struct ModelContext: MapContext {
    
    public let shouldMap: Bool
    
    public init(shouldMap: Bool = true){
        self.shouldMap = shouldMap
    }

}


