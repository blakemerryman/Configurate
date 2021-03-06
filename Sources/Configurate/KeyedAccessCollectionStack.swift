//
//  KeyedAccessCollectionStack.swift
//  ConfiguratePackageDescription
//
//  Created by Patrick Goley on 11/12/17.
//

protocol KeyedAccessCollectionStack: KeyedAccessCollection {
    
    mutating func push<KeyedAccessType: KeyedAccessCollection>(_ collection: KeyedAccessType)
        where KeyedAccessType.Key == Key,
        KeyedAccessType.Value == Value
    
    @discardableResult mutating func pop() -> AnyKeyedAccessCollection<Key, Value>
}

extension KeyedAccessCollectionStack {
    
    mutating public func push(_ dictionary: [Key: Value]) {
        
        let boxed = AnyKeyedAccessCollection(dictionary)
        
        push(boxed)
    }
}
