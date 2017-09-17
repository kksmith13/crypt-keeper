//
//  Coin+CoreDataProperties.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 9/10/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

import Foundation
import CoreData


extension Coin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coin> {
        return NSFetchRequest<Coin>(entityName: "Coin")
    }

    @NSManaged public var symbol: String?
    @NSManaged public var currency: String?
    @NSManaged public var supply: Int16
    @NSManaged public var circulating: Int16
    @NSManaged public var high: Double
    @NSManaged public var low: Double
    @NSManaged public var price: Double
    @NSManaged public var volume: Double
    @NSManaged public var open: Double
    @NSManaged public var marketCap: Double
    
    func initCoinData(symbol: String, currency: String, supply: Int16, circulating: Int16) {
        self.symbol = symbol
        self.currency = currency
        self.supply = supply
        self.circulating = circulating
    }
    
    func updateCoinData(high: Double, low: Double, price: Double, volume: Double, open: Double) {
        self.high = high
        self.low = low
        self.price = price
        self.volume = volume
        self.open = open
        self.marketCap = Double(self.supply) * price
    }

}
