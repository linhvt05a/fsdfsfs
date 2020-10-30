//
//  CustomCell.swift
//  LinhDemo
//
//  Created by admin on 10/29/20.
//  Copyright © 2020 Hahalolo. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var titles: UILabel!
    
    
    override func awakeFromNib() {
       super.awakeFromNib()
        configImage()
        configTitle()
        setImageContrain()
        setTitleContrain()
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
        func configImage(){
        images.layer.cornerRadius = 10
        images.clipsToBounds      = true
        images.contentMode = .scaleAspectFill
    }
  
    func configTitle(){
        titles.numberOfLines = 0
        titles.adjustsFontSizeToFitWidth = true
    }
    
    func setImageContrain(){
        images.translatesAutoresizingMaskIntoConstraints = false
        images.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        images.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        images.heightAnchor.constraint(equalToConstant: 80).isActive = true
        images.widthAnchor.constraint(equalTo: images.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleContrain(){
        titles.translatesAutoresizingMaskIntoConstraints = false
        titles.leadingAnchor.constraint(equalTo: images.trailingAnchor, constant: 10).isActive = true
        titles.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titles.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
