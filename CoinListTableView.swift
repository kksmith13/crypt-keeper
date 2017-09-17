//
//  CoinListView.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 8/14/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

import UIKit

class CoinListTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var coins = [Coin]()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "coinId" + String(indexPath.row)
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: cellId)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CoinTableViewCell
        cell.number.text = String(indexPath.row + 1)
        //set our coin
        cell.coin = coins[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}
