//
//  TabBarController.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 8/27/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIBarButtonItem(image: UIImage(named: "ckLogo")?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: nil)
        let title = UIBarButtonItem(title: "CRYPTKEEPER", style: .plain, target: self, action: nil)
        title.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "GillSans", size: 20)!],
                                     for: .normal)
        
        navigationItem.leftBarButtonItems = [logo, title]
        navigationItem.leftBarButtonItem?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let coinTab = CoinViewController()
        let coinTabBarItem = UITabBarItem(title: "Coins", image: nil, selectedImage: nil)
        
        coinTab.tabBarItem = coinTabBarItem
        
        let watchTab = WatchListViewController()
        let watchTabBarItem = UITabBarItem(title: "Watchlist", image: nil, selectedImage: nil)
        
        watchTab.tabBarItem = watchTabBarItem
        
        let portfolioTab = PortfolioViewController()
        let portfolioTabBarItem = UITabBarItem(title: "Portfolio", image: nil, selectedImage: nil)
        
        portfolioTab.tabBarItem = portfolioTabBarItem
        
        let menuTab = MenuViewController()
        let menuTabBarItem = UITabBarItem(title: "Settings", image: nil, selectedImage: nil)
        
        menuTab.tabBarItem = menuTabBarItem
        
        self.viewControllers = [coinTab, watchTab, portfolioTab, menuTab]
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("easy")
    }
}
