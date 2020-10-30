//
//  ListViewModel.swift
//  LinhDemo
//
//  Created by admin on 10/29/20.
//  Copyright © 2020 Hahalolo. All rights reserved.
//

import Foundation

class ListViewModel {
    weak var vc : ListReposoryViewController?
    let network = NetworkingService()
    var listModel = [ItemModel]()
    func load(){
        network.request(endpoint: "/users?q=hd", parameters: [:]) { (result) in
            switch result {
            case.success(let data):
                for i in data.items ?? [] {
                    self.listModel.append(i)
                }
                DispatchQueue.main.async {
                    self.vc?.listView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
  
}
