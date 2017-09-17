//
//  AppDelegate.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 8/14/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

import UIKit
import CoreData
import SwiftyJSON

let PRIMARY_COLOR_BLUE = UIColor(red:0.10, green:0.12, blue:0.28, alpha:1.0)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = .lightContent
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = PRIMARY_COLOR_BLUE
        appearance.tintColor = .white
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        fetchCoins()
        
        let navController = UINavigationController(rootViewController: TabBarController())
        window?.rootViewController = navController
        
        return true
    }
    
    func fetchCoins() {
        APIClient.sharedInstance.fetchCoins(success: { (response) in
            Helpers.clearCoinData(entity: "Coin")
            self.storeCoins(response: response)
        }, failure: {(error) -> Void in
            print(error.localizedDescription)
        })
    }
    
    func storeCoins(response: JSON) {
        let coins = response["coins"]
        
        for (_, coin) in coins {
            let context = CoreDataStack.sharedManager.managedObjectContext
            let cdCoin = NSEntityDescription.insertNewObject(forEntityName: "Coin", into: context) as! Coin
            print(coin["symbol"])
            cdCoin.initCoinData(symbol: coin["symbol"].string!, currency: coin["currency"].stringValue, supply: coin["supply"].int16Value, circulating: coin["circulating"].int16Value)
            
            let coinData = coin["coinData"]
            cdCoin.updateCoinData(high: coinData["high"].doubleValue, low: coinData["low"].doubleValue, price: coinData["price"].doubleValue, volume: coinData["volume"].doubleValue, open: coinData["open"].doubleValue)
            do {
                try context.save()
            } catch let err {
                print(err)
            }
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

