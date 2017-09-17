//
//  CoinViewControllerHelper.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 9/16/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

import CoreData

extension CoinViewController {
    
    func fetchCoins() {
        let context = CoreDataStack.sharedManager.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coin")
        do {
            coins = try context.fetch(fetchRequest) as? [Coin]
        } catch let err {
            print(err)
        }
    }
}
