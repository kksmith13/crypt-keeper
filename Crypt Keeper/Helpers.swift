//
//  Helpers.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 9/10/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

import Foundation


import UIKit
import CoreData

class Helpers: NSObject {

    //Mark: - Core Data Functions
    static func updateCoinData() {
        let context = CoreDataStack.sharedManager.managedObjectContext
        do {
            try context.save()
        } catch let err {
            print(err)
        }
    }
    
    static func clearCoinData(entity: String) {
        let context = CoreDataStack.sharedManager.managedObjectContext
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
            let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
            for object in objects! {
                context.delete(object)
            }
            try context.save()
        } catch let err {
            print(err)
        }
    }
    
    static func getCoinData(symbol: String, currency: String) -> Any? {
        let context = CoreDataStack.sharedManager.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coin")
        let symbolPredicate = NSPredicate(format: "symbol == %@", symbol)
        let currencyPredicate = NSPredicate(format: "currency == %@", currency)
        let predicate = NSCompoundPredicate(type: .and, subpredicates: [symbolPredicate, currencyPredicate])
        fetchRequest.predicate = predicate
        
        do {
            return try(context.fetch(fetchRequest)).first as? Coin
        } catch let err {
            print(err)
        }
        
        return nil
    }
    
    
    static func getAllCoins() -> [Coin] {
        var coins = [Coin]()
        let context = CoreDataStack.sharedManager.managedObjectContext
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coin")
            let objects = try context.fetch(fetchRequest) as? [Coin]
            for object in objects! {
                coins.append(object)
            }
        } catch let err {
            print(err)
        }
        
        return coins
    }

}
