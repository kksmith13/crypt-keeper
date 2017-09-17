//
//  CoinViewController.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 8/14/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

import UIKit
import CoreData

class CoinViewController: UIViewController {
    
    var coins: [Coin]?
    
    let header: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var coinTable: CoinListTableView = {
        let ct = CoinListTableView(frame: .zero, style: .plain)
        ct.delegate = ct.self
        ct.dataSource = ct.self
        return ct
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoins()
        coinTable.coins = coins!
        
        view.addSubview(header)
        view.addSubview(coinTable)
        
        _ = header.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 64, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 44)
        _ = coinTable.anchor(header.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

    }
}
