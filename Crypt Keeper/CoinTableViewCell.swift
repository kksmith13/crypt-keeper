//
//  CoinTableViewCell.swift
//  Crypt Keeper
//
//  Created by Kyle Smith on 8/14/17.
//  Copyright © 2017 Smith Coding. All rights reserved.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    var coin: Coin? {
        didSet {
            guard let coin = coin else {
                return
            }
            
            priceLabel.text = "$" + String(coin.price)
            guard let symbol = coin.symbol else {
                return
            }
            iconImageView.image = UIImage(named: symbol)
            symbolLabel.text = symbol.uppercased()
        }
    }
    
    let number: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightSemibold)
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .center
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: UIFontWeightRegular)
        label.text = "Ethereum"
        label.sizeToFit()
        return label
    }()
    
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: UIFontWeightBold)
        label.text = "ETH"
        label.sizeToFit()
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: UIFontWeightLight)
        label.text = "$482.23"
        label.sizeToFit()
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupViews() {
        addSubview(number)
        addSubview(separatorView)
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(symbolLabel)
        addSubview(priceLabel)
        
        addConstraint(NSLayoutConstraint(item: number, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: symbolLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraintsWithFormat(format: "H:|-8-[v0(10)]-8-[v1(1)]-6-[v2(32)]-6-[v3]-6-[v4]", views: number, separatorView, iconImageView, nameLabel, symbolLabel)
        addConstraintsWithFormat(format: "H:[v0]-8-|", views: priceLabel)
        
        addConstraintsWithFormat(format: "V:|-6-[v0]-6-|", views: separatorView)
        addConstraintsWithFormat(format: "V:|-6-[v0]-6-|", views: iconImageView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
