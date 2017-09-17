//
//  NSManagedObject+helpers.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 9/16/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

import CoreData
extension NSManagedObject {
    func toDict() -> [String:Any] {
        let keys = Array(entity.attributesByName.keys)
        return dictionaryWithValues(forKeys:keys)
    }
}
