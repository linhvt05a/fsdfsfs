//
//  ListDetailViewController.swift
//  LinhDemo
//
//  Created by admin on 10/29/20.
//  Copyright © 2020 Hahalolo. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    var listDetail  = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupBgColor(to: view, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        configTableview()
        setupTableview(to: view, listName: listDetail, cellName: "CustomDetailCell")
    }

    func configTableview(){
        listDetail.dataSource = self
        listDetail.delegate = self
    }
}

extension ListDetailViewController: UITableViewDelegate {
    
}

extension ListDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomDetailCell", for: indexPath) as! CustomDetailCell
        cell.textLabel?.text = "dasdasdasad"
        
        return cell
    }
    
    
}
