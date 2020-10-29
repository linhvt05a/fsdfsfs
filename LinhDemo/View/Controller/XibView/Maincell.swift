//
//  Maincell.swift
//  LinhDemo
//
//  Created by admin on 10/29/20.
//  Copyright © 2020 Hahalolo. All rights reserved.
//

import Foundation
import UIKit

class MainCell: UITableViewCell {
    var labell = UILabel()
    var imageViews = UIImageView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabel()
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel(){
        addSubview(labell)
        labell.translatesAutoresizingMaskIntoConstraints = false
        labell.numberOfLines = 0
        labell.adjustsFontSizeToFitWidth = true
        labell.leadingAnchor.constraint(equalTo:leadingAnchor, constant: 120).isActive = true
        labell.topAnchor.constraint(equalTo:topAnchor, constant: 20).isActive = true
    }
    
    func setupImageView(){
        addSubview(imageViews)
        imageViews.translatesAutoresizingMaskIntoConstraints = false
        imageViews.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        imageViews.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        imageViews.frame = CGRect(x: 0, y: 0, width: 100, height: 80)
        imageViews.clipsToBounds = true
        imageViews.layer.cornerRadius = 40
    }
}
