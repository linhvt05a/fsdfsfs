//
//  ErrorModel.swift
//  LinhDemo
//
//  Created by admin on 10/29/20.
//  Copyright © 2020 Hahalolo. All rights reserved.
//

import Foundation

struct ErrorModel: Codable, LocalizedError{
    let reason: String
    var errorDescription: String? { return reason }
}
