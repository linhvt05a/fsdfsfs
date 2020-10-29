//
//  ListReposoryViewController.swift
//  LinhDemo
//
//  Created by admin on 10/29/20.
//  Copyright © 2020 Hahalolo. All rights reserved.
//

import UIKit

class ListReposoryViewController: UIViewController {
    
    var listView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupTableview()
    }
    
    func setupTableview(){
        view.addSubview(listView)
        listView.dataSource = self
        listView.delegate = self
        listView.rowHeight = 135
        listView.pinToView(to: view)
        listView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
}

extension ListReposoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.titles.text = "dasdadasda"
        cell.images.image = UIImage(named: "avatar")
       return cell
    }
    
    
}

extension ListReposoryViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listdetail = ListDetailViewController()
            navigateVC(controller: listdetail)
    }
}
