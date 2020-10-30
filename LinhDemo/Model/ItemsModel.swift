//
//  ListModel.swift
//  LinhDemo
//
//  Created by admin on 10/29/20.
//  Copyright © 2020 Hahalolo. All rights reserved.
//

import Foundation


struct ResultModel : Codable {
    let total_count : Int?
    let incomplete_results : Bool?
    let items : [ItemModel]?
    
    enum CodingKeys: String, CodingKey {
        case total_count = "total_count"
        case incomplete_results = "incomplete_results"
        case items = "items"
    }
}

struct ItemModel : Codable {
    let login : String?
    let avatar_url : String?
    let subscriptions_url : String?
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatar_url = "avatar_url"
        case subscriptions_url = "subscriptions_url"
    }
}
