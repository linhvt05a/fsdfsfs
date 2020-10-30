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
    let listViewModel = ListViewModel()
    var img = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewModel.vc = self
        listViewModel.load()
        setupNav()
        configTableview()
        listView.rowHeight = 100
        setupTableview(to: view, listName: listView, cellName: "CustomCell")
    }
    
    func configTableview(){
        listView.dataSource = self
        listView.delegate = self
        
    }
}

extension ListReposoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.listModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = listViewModel.listModel[indexPath.row]
        let dataImage = items.avatar_url ?? ""
        loadImages(dataImage: dataImage)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.titles?.text = items.subscriptions_url
        cell.images?.image = img
       return cell
    }
 
   }

extension ListReposoryViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listdetail = ListDetailViewController()
            navigateVC(controller: listdetail)
    }
    
}
